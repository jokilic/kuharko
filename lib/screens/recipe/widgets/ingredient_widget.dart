import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/shadows.dart';
import '../../../constants/text_styles.dart';
import '../../../controllers/theme_controller.dart';
import '../../../widgets/animated_column.dart';

class IngredientWidget extends StatelessWidget {
  final String image;
  final String title;
  final double amount;
  final String unit;

  const IngredientWidget({
    @required this.image,
    @required this.title,
    @required this.amount,
    @required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 140.0,
          height: 140.0,
          margin: const EdgeInsets.only(right: 24.0),
          decoration: BoxDecoration(
            boxShadow: Shadows.myShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: 140.0,
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Obx(
                () => Text(
                  title,
                  style: MyTextStyles.recipeIngredientName.copyWith(
                    color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.8) : LightColors.textColor.withOpacity(0.8),
                  ),
                ),
              ),
              Obx(
                () => Text(
                  '${amount.toStringAsFixed(1)} $unit',
                  style: MyTextStyles.recipeIngredientAmount.copyWith(
                    color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.4) : LightColors.textColor.withOpacity(0.4),
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
