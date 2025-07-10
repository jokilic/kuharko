import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../screens/results/results_screen.dart';
import '../services/spoonacular_service.dart';
import '../services/theme_service.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.find<SpoonacularService>();
    final themeController = Get.find<ThemeService>();

    return TextField(
      onSubmitted: (value) {
        spoonacularController.searchRecipes(value);
        Get.toNamed(ResultsScreen.routeName);
      },
      onChanged: (value) => spoonacularController.searchQuery = value,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          MyIcons.search,
          width: 30,
          color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
        ),
        hintText: 'Search for a meal...',
        hintStyle: TextStyle(
          color: themeController.darkTheme ? DarkColors.textColor.withValues(alpha: 0.4) : LightColors.textColor.withValues(alpha: 0.4),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeController.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: themeController.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeController.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeController.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
