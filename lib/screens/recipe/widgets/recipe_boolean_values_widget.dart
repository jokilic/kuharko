import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';

class RecipeBooleanValuesWidget extends StatelessWidget {
  final Color color;
  final String icon;
  final String text;

  const RecipeBooleanValuesWidget({
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: 55,
    width: 170,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(36),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          height: 32,
          width: 32,
          color: LightColors.backgroundColor,
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: MyTextStyles.recipeBooleanValues.copyWith(
            color: LightColors.backgroundColor,
          ),
        ),
      ],
    ),
  );
}
