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
  final Function() onTap;
  final Function()? onLongPress;

  const CategoryWidget({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: PressableDough(
        child: Obx(
          () => Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: Shadows.myShadow,
            ),
            child: AnimatedColumn(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: 64,
                  height: 64,
                ),
                const SizedBox(height: 20),
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
