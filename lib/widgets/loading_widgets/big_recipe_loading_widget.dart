import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/colors.dart';
import '../../controllers/theme_controller.dart';
import '../animated_column.dart';

class BigRecipeLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return SizedBox(
      height: Get.height * 0.45,
      width: Get.width * 0.65,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Shimmer.fromColors(
              baseColor: _themeController.darkTheme ? DarkColors.backgroundColor : Colors.grey[400],
              highlightColor: _themeController.darkTheme ? DarkColors.bodyColor : Colors.grey[100],
              child: Container(
                color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 120.0,
            width: double.infinity,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AnimatedColumn(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Shimmer.fromColors(
                            baseColor: _themeController.darkTheme ? DarkColors.backgroundColor : Colors.grey[400],
                            highlightColor: _themeController.darkTheme ? DarkColors.bodyColor : Colors.grey[100],
                            child: Container(
                              color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                              width: Get.width * 0.35,
                              height: 36.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Shimmer.fromColors(
                            baseColor: _themeController.darkTheme ? DarkColors.backgroundColor : Colors.grey[400],
                            highlightColor: _themeController.darkTheme ? DarkColors.bodyColor : Colors.grey[100],
                            child: Container(
                              color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                              width: Get.width * 0.2,
                              height: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Shimmer.fromColors(
                        baseColor: _themeController.darkTheme ? DarkColors.backgroundColor : Colors.grey[400],
                        highlightColor: _themeController.darkTheme ? DarkColors.bodyColor : Colors.grey[100],
                        child: Container(
                          color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                          width: 48.0,
                          height: 48.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Shimmer.fromColors(
                        baseColor: _themeController.darkTheme ? DarkColors.backgroundColor : Colors.grey[400],
                        highlightColor: _themeController.darkTheme ? DarkColors.bodyColor : Colors.grey[100],
                        child: Container(
                          color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                          width: Get.width * 0.1,
                          height: 24.0,
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
