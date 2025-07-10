import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/shadows.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_column.dart';

class CategoryWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final Function onTap;
  final Function onLongPress;

  const CategoryWidget({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeService _themeController = Get.find<ThemeService>();

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: PressableDough(
        child: Obx(
          () => Container(
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: Shadows.myShadow,
            ),
            child: AnimatedColumn(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  icon,
                  width: 64.0,
                  height: 64.0,
                ),
                const SizedBox(height: 20.0),
                Text(
                  title,
                  style: MyTextStyles.categoryTitle.copyWith(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
