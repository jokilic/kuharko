import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';

class RecipeInstructionWidget extends StatelessWidget {
  final int number;
  final String step;

  const RecipeInstructionWidget({
    required this.number,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeService>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            margin: const EdgeInsets.only(left: 8),
            child: Obx(
              () => Text(
                '$number',
                style: MyTextStyles.recipeDirectionNumber.copyWith(
                  color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Obx(
            () => Container(
              width: 4,
              height: 36,
              color: themeController.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Obx(
              () => Text(
                step,
                style: MyTextStyles.recipeDirectionText.copyWith(
                  color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
