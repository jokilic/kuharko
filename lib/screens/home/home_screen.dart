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
  static const String routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.put<SpoonacularService>(SpoonacularService());
    final themeController = Get.find<ThemeService>();

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HeaderWidget(title: 'What would you like to Cook?'),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: SearchWidget(),
                  ),
                  SizedBox(height: 24),
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
                  SizedBox(height: 24),
                  RecipesWidget(
                    recipes: spoonacularController.cuisineRecipes,
                    isBig: true,
                  ),
                  SizedBox(height: 24),
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
                  SizedBox(height: 24),
                  RecipesWidget(
                    recipes: spoonacularController.mealTypeRecipes,
                    isBig: true,
                  ),
                  SizedBox(height: 24),
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
                  SizedBox(height: 74),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: RecipesWidget(
                      recipes: spoonacularController.randomRecipes,
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
