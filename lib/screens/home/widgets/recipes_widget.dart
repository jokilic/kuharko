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
  final bool isBig;

  const RecipesWidget({
    required this.recipes,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    final spoonacularService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();

    return Obx(
      () {
        if (isBig) {
          ///
          /// BIG LOADING
          ///
          if (recipes.isEmpty) {
            return SizedBox(
              height: Get.height * 0.45,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                clipBehavior: Clip.none,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => AnimatedListView(
                  index: index,
                  child: BigRecipeLoadingWidget(),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 20),
              ),
            );
          }

          ///
          /// BIG WIDGET
          ///
          return SizedBox(
            height: Get.height * 0.45,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.none,
              itemCount: recipes.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                final recipe = recipes[index];

                return AnimatedListView(
                  index: index,
                  child: BigRecipeWidget(
                    mealType: recipe.dishTypes.isEmpty ? '' : recipe.dishTypes[0],
                    image: recipe.image,
                    readyInMinutes: recipe.readyInMinutes,
                    title: recipe.title,
                    onTap: () {
                      spoonacularService.getRecipeInformation(recipe.id);
                      Get.to(RecipeScreen.new);
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 20),
            ),
          );
        }

        ///
        /// SMALL WIDGET
        ///
        return SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.none,
            itemCount: recipes.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              final recipe = recipes[index];

              return AnimatedListView(
                index: index,
                child: RecipeWidget(
                  color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                  image: recipe.image,
                  readyInMinutes: recipe.readyInMinutes,
                  title: recipe.title,
                  onTap: () {
                    spoonacularService.getRecipeInformation(recipe.id);
                    Get.to(RecipeScreen.new);
                  },
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 20),
          ),
        );
      },
    );
  }
}
