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
                child: HeaderWidget(title: 'Your favorite recipes'),
              ),
              const SizedBox(height: 84),
              if (spoonacularService.favoriteRecipes.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: AnimatedColumn(
                      children: [
                        PressableDough(
                          child: Image.asset(
                            MyIcons.randomIllustration,
                            height: 142,
                            width: 142,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => Text(
                            "You don't have any favorited recipes yet",
                            textAlign: TextAlign.center,
                            style: MyTextStyles.headline2Text.copyWith(
                              color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  clipBehavior: Clip.none,
                  itemCount: spoonacularService.favoriteRecipes.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (_, index) {
                    final favoriteRecipe = spoonacularService.favoriteRecipes[index];

                    return RecipeWidget(
                      color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                      title: favoriteRecipe[1],
                      image: favoriteRecipe[2],
                      onTap: () {
                        spoonacularService.getRecipeInformation(int.parse(favoriteRecipe[0]));
                        Get.to(RecipeScreen.new);
                      },
                      readyInMinutes: int.parse(favoriteRecipe[3]),
                    );
                  },
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
