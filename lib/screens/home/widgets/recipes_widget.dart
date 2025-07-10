import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../models/recipe/recipe.dart';
import '../../../services/spoonacular_service.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_list_view.dart';
import '../../../widgets/big_recipe_loading_widget.dart';
import '../../../widgets/big_recipe_widget.dart';
import '../../../widgets/recipe_widget.dart';
import '../../recipe/recipe_screen.dart';

class RecipesWidget extends StatelessWidget {
  final List<Recipe> recipes;
  final bool isGrid;
  final bool isBig;

  const RecipesWidget({
    required this.recipes,
    this.isGrid = false,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    final spoonacularService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();

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
              mainAxisSpacing: 80,
              crossAxisSpacing: 20,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (_, index) {
              final recipe = recipes[index];

              return RecipeWidget(
                color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                image: recipe.image,
                readyInMinutes: recipe.readyInMinutes,
                title: recipe.title.length > 24 ? '${recipe.title.substring(0, 24)}...' : recipe.title,
                onTap: () {
                  spoonacularService.getRecipeInformation(recipe.id);
                  Get.to(RecipeScreen.new);
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
                itemBuilder: (_, index) => AnimatedListView(
                  index: index,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: BigRecipeLoadingWidget(),
                  ),
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
              itemBuilder: (_, index) {
                final recipe = recipes[index];

                return AnimatedListView(
                  index: index,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: BigRecipeWidget(
                      mealType: recipe.dishTypes.isEmpty ? '' : recipe.dishTypes[0],
                      image: recipe.image,
                      readyInMinutes: recipe.readyInMinutes,
                      title: recipe.title.length > 20 ? '${recipe.title.substring(0, 20)}...' : recipe.title,
                      onTap: () {
                        spoonacularService.getRecipeInformation(recipe.id);
                        Get.to(RecipeScreen.new);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: recipes.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              final recipe = recipes[index];

              return AnimatedListView(
                index: index,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: RecipeWidget(
                    color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                    image: recipe.image,
                    readyInMinutes: recipe.readyInMinutes,
                    title: recipe.title.length > 24 ? '${recipe.title.substring(0, 24)}...' : recipe.title,
                    onTap: () {
                      spoonacularService.getRecipeInformation(recipe.id);
                      Get.to(RecipeScreen.new);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
