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
    final spoonacularService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HeaderWidget(title: 'Search results below'),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchWidget(),
              ),
              const SizedBox(height: 20),
              Obx(
                () {
                  if (spoonacularService.recipeSearchResult == null) {
                    return AnimatedColumn(
                      children: [
                        const SizedBox(height: 42),
                        SpinKitFoldingCube(
                          color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          size: 36,
                        ),
                        const SizedBox(height: 32),
                        Obx(
                          () => Text(
                            'Just a sec...',
                            style: MyTextStyles.headline2Text.copyWith(
                              color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }

                  if (spoonacularService.recipeSearchResult?.totalResults == 0) {
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
                                  color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: spoonacularService.recipeSearchResult?.results.length ?? 0,
                    itemBuilder: (_, index) {
                      final recipe = spoonacularService.recipeSearchResult?.results[index];

                      if (recipe != null) {
                        return AnimatedListView(
                          index: index,
                          child: RecipeResult(
                            title: recipe.title,
                            description: spoonacularService.cleanDescription(index),
                            image: recipe.image,
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                            clockColor: spoonacularService.clockColor(index),
                            onTap: () {
                              spoonacularService.getRecipeInformation(recipe.id);
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
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
