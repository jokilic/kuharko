import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/search_widget.dart';
import 'widgets/recipes_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.put<SpoonacularService>(SpoonacularService());
    final themeController = Get.find<ThemeService>();

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HeaderWidget(title: 'What would you like to Cook?'),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SearchWidget(),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Something from the ${spoonacularController.randomCuisineName} cuisine',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RecipesWidget(
                    recipes: spoonacularController.cuisineRecipes,
                    isBig: true,
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Some ${spoonacularController.randomMealTypeName} recipes',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RecipesWidget(
                    recipes: spoonacularController.mealTypeRecipes,
                    isBig: true,
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Completely random recipes',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 74),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: RecipesWidget(
                      recipes: spoonacularController.randomRecipes,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
