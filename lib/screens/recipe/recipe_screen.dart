import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../constants/shadows.dart';
import '../../constants/text_styles.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../models/recipe/recipe.dart';
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
  static const String routeName = '/recipe-screen';

  @override
  Widget build(BuildContext context) {
    final SpoonacularService _spoonacularController = Get.find<SpoonacularService>();
    final ThemeService _themeController = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () {
            final Recipe recipe = _spoonacularController.recipeInformation;

            if (recipe == null) {
              return SizedBox(
                height: Get.height,
                child: AnimatedColumn(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const HeaderWidget(chefOnly: true),
                    const SizedBox(height: 50.0),
                    Obx(
                      () => Text(
                        'Just a sec...',
                        style: MyTextStyles.headline2Text.copyWith(
                          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    SpinKitFoldingCube(
                      color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                      size: 36.0,
                    ),
                  ],
                ),
              );
            }

            return Stack(
              children: <Widget>[
                AnimatedColumn(
                  children: <Widget>[
                    Transform.scale(
                      scale: 1.2,
                      child: recipe.image == null
                          ? Image.asset(
                              MyImages.foodPlaceholder,
                              width: double.infinity,
                              height: Get.height * 0.5,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              recipe.image,
                              width: double.infinity,
                              height: Get.height * 0.5,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44.0),
                        color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 36.0,
                            ),
                            child: AnimatedColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Obx(
                                  () => Text(
                                    recipe.title,
                                    style: MyTextStyles.headline1Text.copyWith(
                                      color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                                SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      RecipeGridWidget(
                                        color: _themeController.darkTheme ? DarkColors.greenRecipeColor : LightColors.greenRecipeColor,
                                        icon: MyIcons.clock,
                                        text: '${recipe.readyInMinutes} MIN',
                                      ),
                                      const SizedBox(width: 16.0),
                                      RecipeGridWidget(
                                        color: _themeController.darkTheme ? DarkColors.yellowRecipeColor : LightColors.yellowRecipeColor,
                                        icon: MyIcons.popular,
                                        text: '${recipe.readyInMinutes}',
                                      ),
                                      const SizedBox(width: 16.0),
                                      RecipeGridWidget(
                                        color: _themeController.darkTheme ? DarkColors.blueRecipeColor : LightColors.blueRecipeColor,
                                        icon: MyIcons.money,
                                        text: _spoonacularController.getIngredientPrice(recipe.pricePerServing),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                                Obx(
                                  () => Text(
                                    'Summary',
                                    style: MyTextStyles.headline2Text.copyWith(
                                      color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      if (recipe.cheap)
                                        RecipeBooleanValuesWidget(
                                          color: _themeController.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
                                          icon: MyIcons.money,
                                          text: 'Cheap',
                                        ),
                                      if (recipe.vegan)
                                        RecipeBooleanValuesWidget(
                                          color: _themeController.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
                                          icon: MyIcons.vegan,
                                          text: 'Vegan',
                                        ),
                                      if (recipe.veryHealthy)
                                        RecipeBooleanValuesWidget(
                                          color: _themeController.darkTheme ? DarkColors.redColor : LightColors.redColor,
                                          icon: MyIcons.healthy,
                                          text: 'Healthy',
                                        ),
                                      if (recipe.veryPopular)
                                        RecipeBooleanValuesWidget(
                                          color: _themeController.darkTheme ? DarkColors.yellowRecipeColor : LightColors.yellowRecipeColor,
                                          icon: MyIcons.popular,
                                          text: 'Popular',
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                if (_spoonacularController.cleanSummary(recipe.summary).length > 256 && !_spoonacularController.showMoreSummary) ...<Widget>[
                                  Text(
                                    '${_spoonacularController.cleanSummary(recipe.summary).substring(0, 256)}...',
                                    style: MyTextStyles.recipeSummary.copyWith(
                                      color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _spoonacularController.enableShowMoreSummary,
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      height: 48.0,
                                      alignment: Alignment.centerLeft,
                                      child: Obx(
                                        () => Text(
                                          'see more',
                                          style: MyTextStyles.showMoreSummaryButton.copyWith(
                                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else
                                  Text(
                                    _spoonacularController.cleanSummary(recipe.summary),
                                    style: MyTextStyles.recipeSummary.copyWith(
                                      color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                const SizedBox(height: 24.0),
                                Obx(
                                  () => Text(
                                    'Ingredients',
                                    style: MyTextStyles.headline2Text.copyWith(
                                      color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                SizedBox(
                                  height: 250.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: recipe.extendedIngredients.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final ExtendedIngredients ingredient = recipe.extendedIngredients[index];

                                      return AnimatedListView(
                                        index: index,
                                        child: IngredientWidget(
                                          image: _spoonacularController.getIngredientImage(ingredient.image),
                                          title: ingredient.name,
                                          amount: ingredient.amount,
                                          unit: ingredient.unit,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                if (recipe.analyzedInstructions != null &&
                                    recipe.instructions != null &&
                                    (recipe.analyzedInstructions.isNotEmpty || recipe.instructions.isNotEmpty))
                                  Obx(
                                    () => Text(
                                      'Directions',
                                      style: MyTextStyles.headline2Text.copyWith(
                                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 16.0),
                                if (recipe.analyzedInstructions.isNotEmpty)
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: recipe.analyzedInstructions[0]['steps'].length ?? 0,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, int index) {
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
                                      recipe.instructions ?? '',
                                      style: MyTextStyles.recipeDirectionText.copyWith(
                                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 16.0),
                                KuharkoButton(
                                  text: 'See original recipe',
                                  onTap: () => _spoonacularController.launchURL(recipe.sourceUrl),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 46.0,
                            top: -40.0,
                            child: GestureDetector(
                              onTap: () => _spoonacularController.toggleFavoriteRecipe(recipe),
                              behavior: HitTestBehavior.translucent,
                              child: HeartAnimationWidget(
                                heartIcon: _spoonacularController.recipeIsFavorited ? MyIcons.favoriteFull : MyIcons.favoriteOutline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 24.0,
                  top: Get.height * 0.065,
                  child: GestureDetector(
                    onTap: Get.back,
                    behavior: HitTestBehavior.translucent,
                    child: PressableDough(
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                          shape: BoxShape.circle,
                          boxShadow: Shadows.myShadow,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.asset(
                            MyIcons.back,
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
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
