import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../controllers/spoonacular_controller.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/home_screen/recipes_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final SpoonacularController _spoonacularController =
        Get.put<SpoonacularController>(SpoonacularController());

    return Scaffold(
      backgroundColor: MyColors.bodyColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36.0),
                HeaderWidget(title: 'What would you like to Cook?'),
                SizedBox(height: 16.0),
                SearchWidget(),
                SizedBox(height: 20.0),
                SizedBox(height: 24.0),
                Obx(
                  () => Text(
                    'Something from ${_spoonacularController.randomCuisineName} cuisine',
                    style: MyTextStyles.headline2Text,
                  ),
                ),
                SizedBox(height: 74.0),
                RecipesWidget(recipes: _spoonacularController.cuisineRecipes),
                SizedBox(height: 24.0),
                Obx(
                  () => Text(
                    'Some ${_spoonacularController.randomMealTypeName} recipes',
                    style: MyTextStyles.headline2Text,
                  ),
                ),
                SizedBox(height: 74.0),
                RecipesWidget(recipes: _spoonacularController.mealTypeRecipes),
                SizedBox(height: 24.0),
                Text(
                  'Completely random recipes',
                  style: MyTextStyles.headline2Text,
                ),
                SizedBox(height: 74.0),
                RecipesWidget(
                  recipes: _spoonacularController.randomRecipes,
                  isGrid: true,
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
