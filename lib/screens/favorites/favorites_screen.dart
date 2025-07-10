import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/text_styles.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/recipe_widget.dart';
import '../recipe/recipe_screen.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = '/favorites-screen';

  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.find<SpoonacularService>();
    final themeController = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: AnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),
                HeaderWidget(title: 'Your favorite recipes'),
                SizedBox(height: 84),
                if (spoonacularController.favoriteRecipes.isEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: AnimatedColumn(
                        children: [
                          PressableDough(
                            child: Image.asset(
                              MyIcons.randomIllustration,
                              height: 142,
                              width: 142,
                            ),
                          ),
                          SizedBox(height: 16),
                          Obx(
                            () => Text(
                              "You don't have any favorited recipes yet",
                              textAlign: TextAlign.center,
                              style: MyTextStyles.headline2Text.copyWith(
                                color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  GridView.builder(
                    clipBehavior: Clip.none,
                    itemCount: spoonacularController.favoriteRecipes.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 80,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (_, index) {
                      final List<String> favoriteRecipe = spoonacularController.favoriteRecipes[index];

                      return RecipeWidget(
                        color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                        title: favoriteRecipe[1].length > 24 ? '${favoriteRecipe[1].substring(0, 24)}...' : favoriteRecipe[1],
                        image: favoriteRecipe[2],
                        onTap: () {
                          spoonacularController.getRecipeInformation(int.parse(favoriteRecipe[0]));
                          Get.toNamed(RecipeScreen.routeName);
                        },
                        readyInMinutes: int.parse(favoriteRecipe[3]),
                      );
                    },
                  ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
