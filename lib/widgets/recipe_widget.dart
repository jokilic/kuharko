import 'package:flutter/material.dart';

import '../constants/icons.dart';
import '../constants/images.dart';
import '../constants/shadows.dart';
import '../constants/text_styles.dart';
import 'animated_column.dart';

class RecipeWidget extends StatelessWidget {
  final String image;
  final int readyInMinutes;
  final String title;
  final Color color;
  final Function onTap;

  const RecipeWidget({
    required this.image,
    required this.title,
    required this.onTap,
    required this.color,
    this.readyInMinutes,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: 175.0,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 80.0, 12.0, 6.0),
            child: AnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (readyInMinutes != null)
                  Row(
                    children: <Widget>[
                      Image.asset(
                        MyIcons.clock,
                        width: 24.0,
                        height: 24.0,
                        color: color,
                      ),
                      const SizedBox(width: 6.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: Text(
                          "$readyInMinutes'",
                          style: MyTextStyles.overviewRecipeScore.copyWith(
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 4.0),
                Text(
                  title,
                  style: MyTextStyles.overviewRecipeTitle.copyWith(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -55.0,
          child: Container(
            width: 110.0,
            height: 110.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: Shadows.myShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: image == null
                  ? Image.asset(
                      MyImages.foodPlaceholder,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ],
    ),
  );
}
