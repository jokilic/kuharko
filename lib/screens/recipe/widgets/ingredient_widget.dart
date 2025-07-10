import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/shadows.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_column.dart';

class IngredientWidget extends StatelessWidget {
  final String image;
  final String title;
  final double amount;
  final String unit;

  const IngredientWidget({
    required this.image,
    required this.title,
    required this.amount,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140,
          height: 140,
          margin: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            boxShadow: Shadows.myShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 140,
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  title,
                  style: MyTextStyles.recipeIngredientName.copyWith(
                    color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.8) : LightColors.textColor.withValues(alpha: 0.8),
                  ),
                ),
              ),
              Obx(
                () => Text(
                  '${amount.toStringAsFixed(1)} $unit',
                  style: MyTextStyles.recipeIngredientAmount.copyWith(
                    color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.4) : LightColors.textColor.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
