import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/text_styles.dart';
import '../services/spoonacular_service.dart';
import '../services/theme_service.dart';
import 'animated_column.dart';

class HeaderWidget extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final bool errorHeader;

  const HeaderWidget({
    this.title,
    this.subtitle,
    this.errorHeader = false,
  });

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> with SingleTickerProviderStateMixin {
  late final AnimationController chefAnimationController;
  late final Animation<double> curve;

  @override
  void initState() {
    super.initState();

    chefAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..forward();

    curve = CurvedAnimation(
      parent: chefAnimationController,
      curve: Curves.easeInOutBack,
    );

    chefAnimationController.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(seconds: 3));
          if (mounted) {
            await chefAnimationController.reverse();
          }
        } else if (status == AnimationStatus.dismissed) {
          await Future.delayed(const Duration(seconds: 3));
          if (mounted) {
            await chefAnimationController.forward();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    chefAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spoonacularService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();

    if (widget.title?.isEmpty ?? true) {
      return Center(
        child: RotationTransition(
          turns: Tween<double>(begin: 0, end: 0.03).animate(curve),
          child: GestureDetector(
            onLongPress: spoonacularService.changeThemePlaySound,
            behavior: HitTestBehavior.translucent,
            child: PressableDough(
              child: Image.asset(
                MyImages.chefBig,
                width: Get.width * 0.45,
              ),
            ),
          ),
        ),
      );
    }

    if (widget.errorHeader) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.35,
                child: Obx(
                  () => Text(
                    widget.title!,
                    style: MyTextStyles.headline2Text.copyWith(
                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                    ),
                  ),
                ),
              ),
              if (widget.subtitle?.isNotEmpty ?? false) ...[
                const SizedBox(height: 4),
                SizedBox(
                  width: Get.width * 0.3,
                  child: Obx(
                    () => Text(
                      widget.subtitle!,
                      style: MyTextStyles.headline3Text.copyWith(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          RotationTransition(
            turns: Tween<double>(begin: 0, end: 0.03).animate(curve),
            child: GestureDetector(
              onLongPress: spoonacularService.changeThemePlaySound,
              behavior: HitTestBehavior.translucent,
              child: PressableDough(
                child: Image.asset(
                  MyImages.chefBig,
                  width: Get.width * 0.25,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.5,
              child: Obx(
                () => Text(
                  widget.title!,
                  style: MyTextStyles.headline1Text.copyWith(
                    color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                  ),
                ),
              ),
            ),
            if (widget.subtitle?.isNotEmpty ?? false) ...[
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width * 0.5,
                child: Obx(
                  () => Text(
                    widget.subtitle!,
                    style: MyTextStyles.headline3Text.copyWith(
                      color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        RotationTransition(
          turns: Tween<double>(begin: 0, end: 0.03).animate(curve),
          child: GestureDetector(
            onLongPress: spoonacularService.changeThemePlaySound,
            behavior: HitTestBehavior.translucent,
            child: PressableDough(
              child: Image.asset(
                MyImages.chefBig,
                width: Get.width * 0.35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
