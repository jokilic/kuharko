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
    final themeService = Get.find<ThemeService>();
    final spoonacularService = Get.find<SpoonacularService>();

    return Obx(
      () => Scaffold(
        backgroundColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: HeaderWidget(title: 'What would you like to Cook?'),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchWidget(),
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Something from the ${spoonacularService.randomCuisineName} cuisine',
                      style: MyTextStyles.headline2Text.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                RecipesWidget(
                  recipes: spoonacularService.cuisineRecipes,
                  isBig: true,
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Some ${spoonacularService.randomMealTypeName} recipes',
                      style: MyTextStyles.headline2Text.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                RecipesWidget(
                  recipes: spoonacularService.mealTypeRecipes,
                  isBig: true,
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Completely random recipes',
                      style: MyTextStyles.headline2Text.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 74),
                RecipesWidget(
                  recipes: spoonacularService.randomRecipes,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
