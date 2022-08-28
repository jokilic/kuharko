import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './header_widget.dart';
import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../controllers/theme_controller.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.1,
        vertical: Get.height * 0.25,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const HeaderWidget(
                    title: 'Problems fetching recipes...',
                    errorHeader: true,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'Sadly, the limit for fetching recipes has been reached.',
                    style: Get.height < 700
                        ? MyTextStyles.errorDialogText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            fontSize: 18.0,
                          )
                        : MyTextStyles.errorDialogText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Please try again tomorrow, when the quota gets reset.',
                    style: Get.height < 700
                        ? MyTextStyles.errorDialogText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            fontSize: 18.0,
                          )
                        : MyTextStyles.errorDialogText.copyWith(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -24,
              right: -24,
              child: GestureDetector(
                onTap: Get.back,
                behavior: HitTestBehavior.translucent,
                child: Image.asset(
                  MyIcons.delete,
                  height: 60.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
