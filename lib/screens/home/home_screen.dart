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
    final SpoonacularService _spoonacularController = Get.put<SpoonacularService>(SpoonacularService());
    final ThemeService _themeController = Get.find<ThemeService>();

    return Obx(
      () => Scaffold(
        backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: HeaderWidget(title: 'What would you like to Cook?'),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SearchWidget(),
                  ),
                  const SizedBox(height: 24.0),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Something from the ${_spoonacularController.randomCuisineName} cuisine',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  RecipesWidget(
                    recipes: _spoonacularController.cuisineRecipes,
                    isBig: true,
                  ),
                  const SizedBox(height: 24.0),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Some ${_spoonacularController.randomMealTypeName} recipes',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  RecipesWidget(
                    recipes: _spoonacularController.mealTypeRecipes,
                    isBig: true,
                  ),
                  const SizedBox(height: 24.0),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Completely random recipes',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 74.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: RecipesWidget(
                      recipes: _spoonacularController.randomRecipes,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
