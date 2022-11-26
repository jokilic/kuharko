import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controllers/spoonacular_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../models/recipe/recipe.dart';
import '../../screens/recipe_screen.dart';
import '../../widgets/big_recipe_widget.dart';
import '../../widgets/recipe_widget.dart';
import '../loading_widgets/big_recipe_loading_widget.dart';

class RecipesWidget extends StatelessWidget {
  final List<Recipe> recipes;
  final bool isGrid;
  final bool isBig;

  const RecipesWidget({
    this.recipes,
    this.isGrid = false,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    final SpoonacularController _spoonacularController = Get.find<SpoonacularController>();
    final ThemeController _themeController = Get.find<ThemeController>();

    return Obx(
      () {
        if (isGrid) {
          return GridView.builder(
            clipBehavior: Clip.none,
            itemCount: recipes.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 80.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (BuildContext context, int index) {
              final Recipe recipe = recipes[index];

              return RecipeWidget(
                color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                image: recipe.image,
                score: recipe.spoonacularScore / 20 ?? 0.0,
                title: recipe.title.length > 24 ? '${recipe.title.substring(0, 24)}...' : recipe.title,
                onTap: () {
                  _spoonacularController.getRecipeInformation(recipe.id);
                  Get.toNamed(RecipeScreen.routeName);
                },
              );
            },
          );
        }

        if (isBig) {
          if (recipes.isEmpty) {
            return SizedBox(
              height: Get.height * 0.45,
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: BigRecipeLoadingWidget(),
                ),
              ),
            );
          }

          return SizedBox(
            height: Get.height * 0.45,
            child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: recipes.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final Recipe recipe = recipes[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: BigRecipeWidget(
                    mealType: recipe.dishTypes.isEmpty ? '' : recipe.dishTypes[0],
                    image: recipe.image,
                    readyInMinutes: recipe.readyInMinutes,
                    title: recipe.title.length > 20 ? '${recipe.title.substring(0, 20)}...' : recipe.title,
                    onTap: () {
                      _spoonacularController.getRecipeInformation(recipe.id);
                      Get.toNamed(RecipeScreen.routeName);
                    },
                  ),
                );
              },
            ),
          );
        }

        return SizedBox(
          height: 200.0,
          child: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: recipes.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final Recipe recipe = recipes[index];

              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: RecipeWidget(
                  color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                  image: recipe.image,
                  score: recipe.spoonacularScore / 20 ?? 0.0,
                  title: recipe.title.length > 24 ? '${recipe.title.substring(0, 24)}...' : recipe.title,
                  onTap: () {
                    _spoonacularController.getRecipeInformation(recipe.id);
                    Get.toNamed(RecipeScreen.routeName);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
