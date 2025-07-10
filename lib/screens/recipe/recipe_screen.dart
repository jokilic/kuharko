import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/shadows.dart';
import '../../constants/text_styles.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/animated_list_view.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/kuharko_button.dart';
import 'widgets/heart_animation_widget.dart';
import 'widgets/ingredient_widget.dart';
import 'widgets/recipe_boolean_values_widget.dart';
import 'widgets/recipe_grid_widget.dart';
import 'widgets/recipe_instruction_widget.dart';

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spoonaculaService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () {
            final recipe = spoonaculaService.recipeInformation;

            if (recipe == null) {
              return SizedBox(
                height: Get.height,
                child: AnimatedColumn(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HeaderWidget(),
                    const SizedBox(height: 50),
                    Obx(
                      () => Text(
                        'Just a sec...',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SpinKitFoldingCube(
                      color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                      size: 36,
                    ),
                  ],
                ),
              );
            }

            return Stack(
              children: [
                AnimatedColumn(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Image.network(
                        recipe.image,
                        width: double.infinity,
                        height: Get.height * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44),
                        color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 36,
                            ),
                            child: AnimatedColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    recipe.title,
                                    style: MyTextStyles.headline1Text.copyWith(
                                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      RecipeGridWidget(
                                        color: themeService.darkTheme ? DarkColors.greenRecipeColor : LightColors.greenRecipeColor,
                                        icon: MyIcons.clock,
                                        text: '${recipe.readyInMinutes} MIN',
                                      ),
                                      const SizedBox(width: 16),
                                      RecipeGridWidget(
                                        color: themeService.darkTheme ? DarkColors.yellowRecipeColor : LightColors.yellowRecipeColor,
                                        icon: MyIcons.popular,
                                        text: '${recipe.readyInMinutes}',
                                      ),
                                      const SizedBox(width: 16),
                                      RecipeGridWidget(
                                        color: themeService.darkTheme ? DarkColors.blueRecipeColor : LightColors.blueRecipeColor,
                                        icon: MyIcons.money,
                                        text: spoonaculaService.getIngredientPrice(recipe.pricePerServing),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Obx(
                                  () => Text(
                                    'Summary',
                                    style: MyTextStyles.headline2Text.copyWith(
                                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      if (recipe.cheap)
                                        RecipeBooleanValuesWidget(
                                          color: themeService.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
                                          icon: MyIcons.money,
                                          text: 'Cheap',
                                        ),
                                      if (recipe.vegan)
                                        RecipeBooleanValuesWidget(
                                          color: themeService.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
                                          icon: MyIcons.vegan,
                                          text: 'Vegan',
                                        ),
                                      if (recipe.veryHealthy)
                                        RecipeBooleanValuesWidget(
                                          color: themeService.darkTheme ? DarkColors.redColor : LightColors.redColor,
                                          icon: MyIcons.healthy,
                                          text: 'Healthy',
                                        ),
                                      if (recipe.veryPopular)
                                        RecipeBooleanValuesWidget(
                                          color: themeService.darkTheme ? DarkColors.yellowRecipeColor : LightColors.yellowRecipeColor,
                                          icon: MyIcons.popular,
                                          text: 'Popular',
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                if (spoonaculaService.cleanSummary(recipe.summary).length > 256 && !spoonaculaService.showMoreSummary) ...[
                                  Text(
                                    '${spoonaculaService.cleanSummary(recipe.summary).substring(0, 256)}...',
                                    style: MyTextStyles.recipeSummary.copyWith(
                                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: spoonaculaService.enableShowMoreSummary,
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      height: 48,
                                      alignment: Alignment.centerLeft,
                                      child: Obx(
                                        () => Text(
                                          'see more',
                                          style: MyTextStyles.showMoreSummaryButton.copyWith(
                                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else
                                  Text(
                                    spoonaculaService.cleanSummary(recipe.summary),
                                    style: MyTextStyles.recipeSummary.copyWith(
                                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                const SizedBox(height: 24),
                                Obx(
                                  () => Text(
                                    'Ingredients',
                                    style: MyTextStyles.headline2Text.copyWith(
                                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 250,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: recipe.extendedIngredients.length,
                                    itemBuilder: (_, index) {
                                      final ingredient = recipe.extendedIngredients[index];

                                      return AnimatedListView(
                                        index: index,
                                        child: IngredientWidget(
                                          image: spoonaculaService.getIngredientImage(
                                            ingredient.image,
                                          ),
                                          title: ingredient.name,
                                          amount: ingredient.amount,
                                          unit: ingredient.unit,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 4),
                                if (recipe.analyzedInstructions.isNotEmpty || recipe.instructions.isNotEmpty)
                                  Obx(
                                    () => Text(
                                      'Directions',
                                      style: MyTextStyles.headline2Text.copyWith(
                                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 16),
                                if (recipe.analyzedInstructions.isNotEmpty)
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: recipe.analyzedInstructions[0]['steps'].length ?? 0,
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      final dynamic instruction = recipe.analyzedInstructions[0]['steps'][index];

                                      return AnimatedListView(
                                        index: index,
                                        child: RecipeInstructionWidget(
                                          number: instruction['number'] ?? 0,
                                          step: instruction['step'] ?? '',
                                        ),
                                      );
                                    },
                                  ),
                                if (recipe.analyzedInstructions.isEmpty)
                                  Obx(
                                    () => Text(
                                      recipe.instructions,
                                      style: MyTextStyles.recipeDirectionText.copyWith(
                                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 16),
                                KuharkoButton(
                                  text: 'See original recipe',
                                  onTap: () => spoonaculaService.openUrlExternalBrowser(
                                    url: recipe.sourceUrl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 46,
                            top: -40,
                            child: GestureDetector(
                              onTap: () => spoonaculaService.toggleFavoriteRecipe(recipe),
                              behavior: HitTestBehavior.translucent,
                              child: HeartAnimationWidget(
                                heartIcon: spoonaculaService.recipeIsFavorited ? MyIcons.favoriteFull : MyIcons.favoriteOutline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 24,
                  top: Get.height * 0.065,
                  child: GestureDetector(
                    onTap: Get.back,
                    behavior: HitTestBehavior.translucent,
                    child: PressableDough(
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                          shape: BoxShape.circle,
                          boxShadow: Shadows.myShadow,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Image.asset(
                            MyIcons.back,
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
