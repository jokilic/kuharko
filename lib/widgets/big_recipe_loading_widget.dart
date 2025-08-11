import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../services/theme_service.dart';
import 'animated_column.dart';

class BigRecipeLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Animate(
      onPlay: (controller) => controller.loop(
        reverse: true,
        min: 0.6,
      ),
      effects: const [
        FadeEffect(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 1500),
        ),
      ],
      child: SizedBox(
        height: Get.height * 0.45,
        width: Get.width * 0.65,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AnimatedColumn(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
                              width: Get.width * 0.35,
                              height: 36,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
                              width: Get.width * 0.2,
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedColumn(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
                          width: 48,
                          height: 48,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
                          width: Get.width * 0.1,
                          height: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
