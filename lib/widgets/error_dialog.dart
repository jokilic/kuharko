import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../services/theme_service.dart';
import './header_widget.dart';
import 'animated_column.dart';

class ErrorDialog extends StatelessWidget {
  final String text1;
  final String? text2;

  const ErrorDialog({
    required this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.1,
        vertical: Get.height * 0.25,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(32),
              child: AnimatedColumn(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderWidget(
                    title: 'Problems fetching recipes...',
                    errorHeader: true,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    text1,
                    style: Get.height < 700
                        ? MyTextStyles.errorDialogText.copyWith(
                            color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            fontSize: 18,
                          )
                        : MyTextStyles.errorDialogText.copyWith(
                            color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                  ),
                  if (text2?.isNotEmpty ?? false) ...[
                    const SizedBox(height: 12),
                    Text(
                      text2!,
                      style: Get.height < 700
                          ? MyTextStyles.errorDialogText.copyWith(
                              color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              fontSize: 18,
                            )
                          : MyTextStyles.errorDialogText.copyWith(
                              color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            ),
                    ),
                  ],
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
