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
                child: HeaderWidget(
                  title: 'Ask Kuharko Marko...',
                  subtitle: 'Colored words can be tapped',
                ),
              ),
              const SizedBox(height: 36),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'I want recipes from ',
                      style: MyTextStyles.searchText.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularService.wantedCuisines.isEmpty ? '_____' : spoonacularService.wantedCuisines.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Your preferred cuisines',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: cuisines,
                                chosenControllerList: spoonacularService.wantedCuisinesList,
                                setJoinedValues: (joinedValues) => spoonacularService.wantedCuisines = joinedValues,
                              ),
                            ),
                        ),
                        const TextSpan(
                          text: ' cuisines and I want the food to be ',
                        ),
                        TextSpan(
                          text: spoonacularService.wantedDiets.isEmpty ? '_____' : spoonacularService.wantedDiets.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Your preferred diet',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: diets,
                                chosenControllerList: spoonacularService.wantedDietsList,
                                multiValue: false,
                                setJoinedValues: (joinedValues) => spoonacularService.wantedDiets = joinedValues,
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
              ),
              const SizedBox(height: 16),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "I'm ",
                      style: MyTextStyles.searchText.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularService.nonWantedIntolerances.isEmpty ? '_____' : spoonacularService.nonWantedIntolerances.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Your intolerances',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: intolerances,
                                chosenControllerList: spoonacularService.intolerancesList,
                                setJoinedValues: (joinedValues) => spoonacularService.nonWantedIntolerances = joinedValues,
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
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'The ingredients I have in my kitchen are ',
                      style: MyTextStyles.searchText.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularService.wantedIngredients.isEmpty ? '_____' : spoonacularService.wantedIngredients.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              SearchDialog(
                                title: 'Ingredients in your kitchen',
                                image: MyIcons.randomIllustration,
                                hintText: 'Enter your ingredient...',
                                hintIcon: MyIcons.ingredients,
                                chosenTextController: spoonacularService.ingredientsInKitchenController,
                                chosenControllerList: spoonacularService.ingredientsInKitchen,
                                setJoinedValues: (joinedValues) => spoonacularService.wantedIngredients = joinedValues,
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
              ),
              const SizedBox(height: 16),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "I don't want ",
                      style: MyTextStyles.searchText.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularService.nonWantedIngredients.isEmpty ? '_____' : spoonacularService.nonWantedIngredients.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              SearchDialog(
                                title: "Ingredients you don't want",
                                image: MyIcons.randomIllustration,
                                hintText: 'Enter unwanted ingredient...',
                                hintIcon: MyIcons.ingredients,
                                chosenTextController: spoonacularService.unwantedIngredientsInKitchenController,
                                chosenControllerList: spoonacularService.unwantedIngredientsInKitchen,
                                setJoinedValues: (joinedValues) => spoonacularService.nonWantedIngredients = joinedValues,
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
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "I'm trying to find ",
                      style: MyTextStyles.searchText.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularService.wantedMealTypes.isEmpty ? '_____' : spoonacularService.wantedMealTypes.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              CheckboxDialog(
                                title: 'Preferred meal types',
                                icon: MyIcons.randomIllustration,
                                chosenEnums: mealTypes,
                                chosenControllerList: spoonacularService.wantedMealTypesList,
                                multiValue: false,
                                setJoinedValues: (joinedValues) => spoonacularService.wantedMealTypes = joinedValues,
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
              ),
              const SizedBox(height: 16),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'I want my food to be ready in ',
                      style: MyTextStyles.searchText.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: spoonacularService.wantedMinutesChosen ? '${spoonacularService.wantedMinutes} MINUTES' : '_____',
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: themeService.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                              Obx(
                                () => MinutesDialog(
                                  title: 'Choose desired minutes',
                                  icon: MyIcons.timer,
                                  minutes: spoonacularService.wantedMinutes,
                                  minusPressed: spoonacularService.decrementMinutes,
                                  minusLongPressStart: spoonacularService.minusLongPressStart,
                                  minusLongPressEnd: spoonacularService.disableLongPress,
                                  plusPressed: spoonacularService.incrementMinutes,
                                  plusLongPressStart: spoonacularService.plusLongPressStart,
                                  plusLongPressEnd: spoonacularService.disableLongPress,
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
              ),
              const SizedBox(height: 56),
              KuharkoButton(
                text: 'Find recipes'.toUpperCase(),
                onTap: () {
                  spoonacularService.complexRecipeSearch();
                  Get.to(ResultsScreen.new);
                },
              ),
              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}
