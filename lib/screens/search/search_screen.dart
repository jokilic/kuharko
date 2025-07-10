import 'package:dough/dough.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/cuisine.dart';
import '../../constants/diets.dart';
import '../../constants/icons.dart';
import '../../constants/intolerance.dart';
import '../../constants/meal_type.dart';
import '../../constants/text_styles.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/kuharko_button.dart';
import '../results/results_screen.dart';
import 'widgets/checkbox_dialog.dart';
import 'widgets/minutes_dialog.dart';
import 'widgets/search_dialog.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search-screen';

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
                const HeaderWidget(
                  title: 'Ask Kuharko Marko...',
                  subtitle: 'Colored words can be tapped',
                  hasSubtitle: true,
                ),
                const SizedBox(height: 36),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'I want recipes from ',
                      style: MyTextStyles.searchText.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularController.wantedCuisines.isEmpty ? '_____' : spoonacularController.wantedCuisines.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Your preferred cuisines',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: cuisines,
                                chosenControllerList: spoonacularController.wantedCuisinesList,
                                setJoinedValues: (joinedValues) => spoonacularController.wantedCuisines = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: ' cuisines and I want the food to be ',
                        ),
                        TextSpan(
                          text: spoonacularController.wantedDiets.isEmpty ? '_____' : spoonacularController.wantedDiets.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Your preferred diet',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: diets,
                                chosenControllerList: spoonacularController.wantedDietsList,
                                multiValue: false,
                                setJoinedValues: (joinedValues) => spoonacularController.wantedDiets = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: "I'm ",
                      style: MyTextStyles.searchText.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularController.nonWantedIntolerances.isEmpty ? '_____' : spoonacularController.nonWantedIntolerances.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Your intolerances',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: intolerances,
                                chosenControllerList: spoonacularController.intolerancesList,
                                setJoinedValues: (joinedValues) => spoonacularController.nonWantedIntolerances = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: " intolerant, so I don't need those recipes.",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Center(
                  child: PressableDough(
                    child: Image.asset(
                      MyIcons.randomIllustration,
                      height: 142,
                      width: 142,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'The ingredients I have in my kitchen are ',
                      style: MyTextStyles.searchText.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularController.wantedIngredients.isEmpty ? '_____' : spoonacularController.wantedIngredients.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              SearchDialog(
                                title: 'Ingredients in your kitchen',
                                image: MyIcons.randomIllustration,
                                hintText: 'Enter your ingredient...',
                                hintIcon: MyIcons.ingredients,
                                chosenTextController: spoonacularController.ingredientsInKitchenController,
                                chosenControllerList: spoonacularController.ingredientsInKitchen,
                                setJoinedValues: (joinedValues) => spoonacularController.wantedIngredients = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: "I don't want ",
                      style: MyTextStyles.searchText.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularController.nonWantedIngredients.isEmpty ? '_____' : spoonacularController.nonWantedIngredients.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              SearchDialog(
                                title: "Ingredients you don't want",
                                image: MyIcons.randomIllustration,
                                hintText: 'Enter unwanted ingredient...',
                                hintIcon: MyIcons.ingredients,
                                chosenTextController: spoonacularController.unwantedIngredientsInKitchenController,
                                chosenControllerList: spoonacularController.unwantedIngredientsInKitchen,
                                setJoinedValues: (joinedValues) => spoonacularController.nonWantedIngredients = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: ' in my food.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Center(
                  child: PressableDough(
                    child: Image.asset(
                      MyIcons.randomIllustration,
                      height: 142,
                      width: 142,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: "I'm trying to find ",
                      style: MyTextStyles.searchText.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularController.wantedMealTypes.isEmpty ? '_____' : spoonacularController.wantedMealTypes.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Preferred meal types',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: mealTypes,
                                chosenControllerList: spoonacularController.wantedMealTypesList,
                                multiValue: false,
                                setJoinedValues: (joinedValues) => spoonacularController.wantedMealTypes = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: ' meals.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'I want my food to be ready in ',
                      style: MyTextStyles.searchText.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularController.wantedMinutesChosen ? '${spoonacularController.wantedMinutes} MINUTES' : '_____',
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              Obx(
                                () => MinutesDialog(
                                  title: 'Choose desired minutes',
                                  icon: MyIcons.timer,
                                  minutes: spoonacularController.wantedMinutes,
                                  minusPressed: spoonacularController.decrementMinutes,
                                  minusLongPressStart: spoonacularController.minusLongPressStart,
                                  minusLongPressEnd: (_) => spoonacularController.disableLongPress(),
                                  plusPressed: spoonacularController.incrementMinutes,
                                  plusLongPressStart: spoonacularController.plusLongPressStart,
                                  plusLongPressEnd: (_) => spoonacularController.disableLongPress(),
                                ),
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: ' or less.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                KuharkoButton(
                  text: 'Find recipes'.toUpperCase(),
                  onTap: () {
                    spoonacularController.complexRecipeSearch();
                    Get.toNamed(ResultsScreen.routeName);
                  },
                ),
                const SizedBox(height: 56),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
