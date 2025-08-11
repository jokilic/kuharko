import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_column.dart';

class MinutesDialog extends StatelessWidget {
  final String title;
  final String icon;
  final int minutes;
  final Function() minusPressed;
  final Function() plusPressed;
  final Function() plusLongPressStart;
  final Function() plusLongPressEnd;
  final Function() minusLongPressStart;
  final Function() minusLongPressEnd;

  const MinutesDialog({
    required this.title,
    required this.icon,
    required this.minutes,
    required this.minusPressed,
    required this.plusPressed,
    required this.plusLongPressStart,
    required this.plusLongPressEnd,
    required this.minusLongPressStart,
    required this.minusLongPressEnd,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              ),
              height: Get.height < 768 ? Get.height * 0.35 : Get.height * 0.25,
              width: Get.width * 0.8,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: AnimatedColumn(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icon,
                          height: 56,
                          width: 56,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Obx(
                            () => Text(
                              title,
                              style: MyTextStyles.searchDialogHeadingText.copyWith(
                                color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: minusPressed,
                          onLongPressStart: (_) => minusLongPressStart(),
                          onLongPressEnd: (_) => minusLongPressEnd(),
                          behavior: HitTestBehavior.translucent,
                          child: Image.asset(
                            MyIcons.minus,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Obx(
                          () => Text(
                            '$minutes',
                            style: MyTextStyles.searchDialogMinuteText.copyWith(
                              color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        GestureDetector(
                          onTap: plusPressed,
                          onLongPressStart: (_) => plusLongPressStart(),
                          onLongPressEnd: (_) => plusLongPressEnd(),
                          behavior: HitTestBehavior.translucent,
                          child: Image.asset(
                            MyIcons.plus,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
