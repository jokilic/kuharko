import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../widgets/animated_column.dart';
import '../widgets/animated_list_view.dart';
import './recipe_screen.dart';
import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../controllers/spoonacular_controller.dart';
import '../controllers/theme_controller.dart';
import '../models/recipe/recipe_search_result.dart';
import '../widgets/header_widget.dart';
import '../widgets/results_screen/recipe_result.dart';
import '../widgets/search_widget.dart';

class ResultsScreen extends StatelessWidget {
  static const String routeName = '/results-screen';

  @override
  Widget build(BuildContext context) {
    final SpoonacularController _spoonacularController = Get.find<SpoonacularController>();
    final ThemeController _themeController = Get.find<ThemeController>();

    return Scaffold(
      backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 36.0),
                const HeaderWidget(title: 'Search results below'),
                const SizedBox(height: 16.0),
                SearchWidget(),
                const SizedBox(height: 20.0),
                Obx(
                  () {
                    if (_spoonacularController.recipeSearchResult == null) {
                      return AnimatedColumn(
                        children: <Widget>[
                          const SizedBox(height: 42.0),
                          SpinKitFoldingCube(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                            size: 36.0,
                          ),
                          const SizedBox(height: 32.0),
                          Obx(
                            () => Text(
                              'Just a sec...',
                              style: MyTextStyles.headline2Text.copyWith(
                                color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }

                    if (_spoonacularController.recipeSearchResult.totalResults == 0) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          padding: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: AnimatedColumn(
                            children: <Widget>[
                              Image.asset(
                                MyIcons.randomIllustration,
                                height: 156.0,
                                width: 156.0,
                              ),
                              const SizedBox(height: 16.0),
                              Obx(
                                () => Text(
                                  'Sorry, but there are no recipes here',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.headline2Text.copyWith(
                                    color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _spoonacularController.recipeSearchResult.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        final RecipeSearchResults recipe = _spoonacularController.recipeSearchResult.results[index];

                        return AnimatedListView(
                          index: index,
                          child: RecipeResult(
                            title: recipe.title.length > 24 ? '${recipe.title.substring(0, 24)}...' : recipe.title,
                            description: Get.height < 700
                                ? '${_spoonacularController.cleanDescription(index).substring(0, 64)}...'
                                : '${_spoonacularController.cleanDescription(index).substring(0, 80)}...',
                            image: recipe.image,
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                            clockColor: _spoonacularController.clockColor(index),
                            onTap: () {
                              _spoonacularController.getRecipeInformation(recipe.id);
                              Get.toNamed(RecipeScreen.routeName);
                            },
                            minutes: recipe.readyInMinutes,
                            isVegan: recipe.vegan,
                            isHealthy: recipe.veryHealthy,
                            isCheap: recipe.cheap,
                            isPopular: recipe.veryPopular,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
