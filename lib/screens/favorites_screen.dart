import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../controllers/spoonacular_controller.dart';
import '../controllers/theme_controller.dart';
import '../screens/recipe_screen.dart';
import '../widgets/header_widget.dart';
import '../widgets/recipe_widget.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = '/favorites-screen';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 36.0),
                const HeaderWidget(title: 'Your favorite recipes'),
                const SizedBox(height: 84.0),
                if (_spoonacularController.favoriteRecipes.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: Column(
                        children: <Widget>[
                          PressableDough(
                            child: Image.asset(
                              MyIcons.randomIllustration,
                              height: 142.0,
                              width: 142.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Obx(
                            () => Text(
                              "You don't have any favorited recipes yet",
                              textAlign: TextAlign.center,
                              style: MyTextStyles.headline2Text.copyWith(
                                color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
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
                    itemCount: _spoonacularController.favoriteRecipes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 80.0,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final List<String> favoriteRecipe = _spoonacularController.favoriteRecipes[index];

                      return RecipeWidget(
                        color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                        title: favoriteRecipe[1].length > 24 ? '${favoriteRecipe[1].substring(0, 24)}...' : favoriteRecipe[1],
                        image: favoriteRecipe[2],
                        onTap: () {
                          _spoonacularController.getRecipeInformation(int.parse(favoriteRecipe[0]));
                          Get.toNamed(RecipeScreen.routeName);
                        },
                        readyInMinutes: int.parse(favoriteRecipe[3]),
                      );
                    },
                  ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
