import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../services/theme_service.dart';
import './header_widget.dart';
import 'animated_column.dart';

class ErrorDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const ErrorDialog({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeService>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.1,
        vertical: Get.height * 0.25,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: AnimatedColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HeaderWidget(
                    title: 'Problems fetching recipes...',
                    errorHeader: true,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title ?? 'Sadly, the limit for fetching recipes has been reached.',
                    style: Get.height < 700
                        ? MyTextStyles.errorDialogText.copyWith(
                            color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            fontSize: 18,
                          )
                        : MyTextStyles.errorDialogText.copyWith(
                            color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    subtitle ?? 'Please try again tomorrow, when the quota gets reset.',
                    style: Get.height < 700
                        ? MyTextStyles.errorDialogText.copyWith(
                            color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            fontSize: 18,
                          )
                        : MyTextStyles.errorDialogText.copyWith(
                            color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
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
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
