import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../services/theme_service.dart';
import 'animated_column.dart';
import 'kuharko_image.dart';

class BigRecipeWidget extends StatelessWidget {
  final Function() onTap;
  final String? image;
  final String title;
  final String mealType;
  final int readyInMinutes;

  const BigRecipeWidget({
    required this.onTap,
    required this.image,
    required this.title,
    required this.mealType,
    required this.readyInMinutes,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: Get.height * 0.45,
        width: Get.width * 0.65,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: KuharkoImage(
                image,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Obx(
              () => Container(
                height: 120,
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
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
                              Text(
                                title,
                                style: MyTextStyles.bigRecipeWidgetTitle.copyWith(
                                  color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                mealType,
                                style: MyTextStyles.bigRecipeWidgetSubtitle.copyWith(
                                  color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.4) : LightColors.textColor.withValues(alpha: 0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedColumn(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            MyIcons.alarm,
                            width: 42,
                            height: 42,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "$readyInMinutes'",
                            style: MyTextStyles.bigRecipeWidgetRating.copyWith(
                              color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
