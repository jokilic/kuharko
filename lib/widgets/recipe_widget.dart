import 'package:flutter/material.dart';

import '../constants/icons.dart';
import '../constants/shadows.dart';
import '../constants/text_styles.dart';
import 'animated_column.dart';
import 'kuharko_image.dart';

class RecipeWidget extends StatelessWidget {
  final String? image;
  final int readyInMinutes;
  final String title;
  final Color color;
  final Function() onTap;

  const RecipeWidget({
    required this.image,
    required this.title,
    required this.onTap,
    required this.color,
    required this.readyInMinutes,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 175,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 80, 12, 6),

            child: AnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      MyIcons.clock,
                      width: 24,
                      height: 24,
                      color: color,
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(
                        "$readyInMinutes'",
                        style: MyTextStyles.overviewRecipeScore.copyWith(
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: MyTextStyles.overviewRecipeTitle.copyWith(
                    color: color,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -55,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: Shadows.myShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: KuharkoImage(image),
            ),
          ),
        ),
      ],
    ),
  );
}
