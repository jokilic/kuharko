import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors.dart';
import '../services/theme_service.dart';
import 'animated_column.dart';

class BigRecipeLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return SizedBox(
      height: Get.height * 0.45,
      width: Get.width * 0.65,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Shimmer.fromColors(
              baseColor: themeService.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
              highlightColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              child: Container(
                color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Container(
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
                          Shimmer.fromColors(
                            baseColor: themeService.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
                            highlightColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                            child: Container(
                              color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                              width: Get.width * 0.35,
                              height: 36,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Shimmer.fromColors(
                            baseColor: themeService.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
                            highlightColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                            child: Container(
                              color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                              width: Get.width * 0.2,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: themeService.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
                        highlightColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                        child: Container(
                          color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                          width: 48,
                          height: 48,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Shimmer.fromColors(
                        baseColor: themeService.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
                        highlightColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                        child: Container(
                          color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                          width: Get.width * 0.1,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
