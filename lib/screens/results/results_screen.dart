import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/text_styles.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/animated_list_view.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/search_widget.dart';
import '../recipe/recipe_screen.dart';
import 'widgets/recipe_result.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.find<SpoonacularService>();
    final themeController = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                const HeaderWidget(title: 'Search results below'),
                const SizedBox(height: 16),
                SearchWidget(),
                const SizedBox(height: 20),
                Obx(
                  () {
                    if (spoonacularController.recipeSearchResult == null) {
                      return AnimatedColumn(
                        children: [
                          const SizedBox(height: 42),
                          SpinKitFoldingCube(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                            size: 36,
                          ),
                          const SizedBox(height: 32),
                          Obx(
                            () => Text(
                              'Just a sec...',
                              style: MyTextStyles.headline2Text.copyWith(
                                color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }

                    if (spoonacularController.recipeSearchResult?.totalResults == 0) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: AnimatedColumn(
                            children: [
                              Image.asset(
                                MyIcons.randomIllustration,
                                height: 156,
                                width: 156,
                              ),
                              const SizedBox(height: 16),
                              Obx(
                                () => Text(
                                  'Sorry, but there are no recipes here',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.headline2Text.copyWith(
                                    color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
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
                      itemCount: spoonacularController.recipeSearchResult?.results.length,
                      itemBuilder: (_, index) {
                        final recipe = spoonacularController.recipeSearchResult?.results[index];

                        if (recipe != null) {
                          return AnimatedListView(
                            index: index,
                            child: RecipeResult(
                              title: recipe.title.length > 24 ? '${recipe.title.substring(0, 24)}...' : recipe.title,
                              description: Get.height < 700
                                  ? '${spoonacularController.cleanDescription(index).substring(0, 64)}...'
                                  : '${spoonacularController.cleanDescription(index).substring(0, 80)}...',
                              image: recipe.image,
                              color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                              clockColor: spoonacularController.clockColor(index),
                              onTap: () {
                                spoonacularController.getRecipeInformation(recipe.id);
                                Get.to(RecipeScreen.new);
                              },
                              minutes: recipe.readyInMinutes,
                              isVegan: recipe.vegan,
                              isHealthy: recipe.veryHealthy,
                              isCheap: recipe.cheap,
                              isPopular: recipe.veryPopular,
                            ),
                          );
                        }

                        return const SizedBox.shrink();
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
