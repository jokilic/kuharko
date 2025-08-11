import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';
import '../../../widgets/animated_column.dart';

class RecipeGridWidget extends StatelessWidget {
  final Color color;
  final String text;
  final String icon;

  const RecipeGridWidget({
    required this.color,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: 160,
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.15),
      borderRadius: BorderRadius.circular(16),
    ),
    child: AnimatedColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 60,
          height: 60,
          color: color,
        ),
        const SizedBox(height: 16),
        Text(
          text,
          style: MyTextStyles.recipeGrid.copyWith(
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
