import 'package:dough/dough.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../controllers/spoonacular_controller.dart';
import '../controllers/theme_controller.dart';
import '../enums/cuisine.dart';
import '../enums/diets.dart';
import '../enums/intolerance.dart';
import '../enums/meal_type.dart';
import '../screens/results_screen.dart';
import '../widgets/animated_column.dart';
import '../widgets/header_widget.dart';
import '../widgets/kuharko_button.dart';
import '../widgets/search_screen/checkbox_dialog.dart';
import '../widgets/search_screen/minutes_dialog.dart';
import '../widgets/search_screen/search_dialog.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search-screen';

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
                const HeaderWidget(
                  title: 'Ask Kuharko Marko...',
                  subtitle: 'Colored words can be tapped',
                  hasSubtitle: true,
                ),
                const SizedBox(height: 36.0),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'I want recipes from ',
                      style: MyTextStyles.searchText.copyWith(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: _spoonacularController.wantedCuisines.isEmpty ? '_____' : _spoonacularController.wantedCuisines.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  CheckboxDialog(
                                    title: 'Your preferred cuisines',
                                    icon: MyIcons.randomIllustration,
                                    chosenEnums: cuisines,
                                    chosenControllerList: _spoonacularController.wantedCuisinesList,
                                    setJoinedValues: (joinedValues) => _spoonacularController.wantedCuisines = joinedValues,
                                  ),
                                ),
                        ),
                        const TextSpan(
                          text: ' cuisines and I want the food to be ',
                        ),
                        TextSpan(
                          text: _spoonacularController.wantedDiets.isEmpty ? '_____' : _spoonacularController.wantedDiets.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  CheckboxDialog(
                                    title: 'Your preferred diet',
                                    icon: MyIcons.randomIllustration,
                                    chosenEnums: diets,
                                    chosenControllerList: _spoonacularController.wantedDietsList,
                                    multiValue: false,
                                    setJoinedValues: (String joinedValues) => _spoonacularController.wantedDiets = joinedValues,
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
                const SizedBox(height: 16.0),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: "I'm ",
                      style: MyTextStyles.searchText.copyWith(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: _spoonacularController.nonWantedIntolerances.isEmpty ? '_____' : _spoonacularController.nonWantedIntolerances.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  CheckboxDialog(
                                    title: 'Your intolerances',
                                    icon: MyIcons.randomIllustration,
                                    chosenEnums: intolerances,
                                    chosenControllerList: _spoonacularController.intolerancesList,
                                    setJoinedValues: (String joinedValues) => _spoonacularController.nonWantedIntolerances = joinedValues,
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
                const SizedBox(height: 36.0),
                Center(
                  child: PressableDough(
                    child: Image.asset(
                      MyIcons.randomIllustration,
                      height: 142.0,
                      width: 142.0,
                    ),
                  ),
                ),
                const SizedBox(height: 36.0),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'The ingredients I have in my kitchen are ',
                      style: MyTextStyles.searchText.copyWith(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: _spoonacularController.wantedIngredients.isEmpty ? '_____' : _spoonacularController.wantedIngredients.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  SearchDialog(
                                    title: 'Ingredients in your kitchen',
                                    image: MyIcons.randomIllustration,
                                    hintText: 'Enter your ingredient...',
                                    hintIcon: MyIcons.ingredients,
                                    chosenTextController: _spoonacularController.ingredientsInKitchenController,
                                    chosenControllerList: _spoonacularController.ingredientsInKitchen,
                                    setJoinedValues: (String joinedValues) => _spoonacularController.wantedIngredients = joinedValues,
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
                const SizedBox(height: 16.0),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: "I don't want ",
                      style: MyTextStyles.searchText.copyWith(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: _spoonacularController.nonWantedIngredients.isEmpty ? '_____' : _spoonacularController.nonWantedIngredients.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  SearchDialog(
                                    title: "Ingredients you don't want",
                                    image: MyIcons.randomIllustration,
                                    hintText: 'Enter unwanted ingredient...',
                                    hintIcon: MyIcons.ingredients,
                                    chosenTextController: _spoonacularController.unwantedIngredientsInKitchenController,
                                    chosenControllerList: _spoonacularController.unwantedIngredientsInKitchen,
                                    setJoinedValues: (String joinedValues) => _spoonacularController.nonWantedIngredients = joinedValues,
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
                const SizedBox(height: 36.0),
                Center(
                  child: PressableDough(
                    child: Image.asset(
                      MyIcons.randomIllustration,
                      height: 142.0,
                      width: 142.0,
                    ),
                  ),
                ),
                const SizedBox(height: 36.0),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: "I'm trying to find ",
                      style: MyTextStyles.searchText.copyWith(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: _spoonacularController.wantedMealTypes.isEmpty ? '_____' : _spoonacularController.wantedMealTypes.toUpperCase(),
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  CheckboxDialog(
                                    title: 'Preferred meal types',
                                    icon: MyIcons.randomIllustration,
                                    chosenEnums: mealTypes,
                                    chosenControllerList: _spoonacularController.wantedMealTypesList,
                                    multiValue: false,
                                    setJoinedValues: (String joinedValues) => _spoonacularController.wantedMealTypes = joinedValues,
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
                const SizedBox(height: 16.0),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'I want my food to be ready in ',
                      style: MyTextStyles.searchText.copyWith(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: _spoonacularController.wantedMinutesChosen ? '${_spoonacularController.wantedMinutes} MINUTES' : '_____',
                          style: MyTextStyles.searchDynamicText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.randomColor : LightColors.randomColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.dialog(
                                  Obx(
                                    () => MinutesDialog(
                                      title: 'Choose desired minutes',
                                      icon: MyIcons.timer,
                                      minutes: _spoonacularController.wantedMinutes,
                                      minusPressed: _spoonacularController.decrementMinutes,
                                      minusLongPressStart: _spoonacularController.minusLongPressStart,
                                      minusLongPressEnd: (_) => _spoonacularController.disableLongPress(),
                                      plusPressed: _spoonacularController.incrementMinutes,
                                      plusLongPressStart: _spoonacularController.plusLongPressStart,
                                      plusLongPressEnd: (_) => _spoonacularController.disableLongPress(),
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
                const SizedBox(height: 56.0),
                KuharkoButton(
                  text: 'Find recipes'.toUpperCase(),
                  onTap: () {
                    _spoonacularController.complexRecipeSearch();
                    Get.toNamed(ResultsScreen.routeName);
                  },
                ),
                const SizedBox(height: 56.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
