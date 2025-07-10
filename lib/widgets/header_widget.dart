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
  final String title;
  final bool chefOnly;
  final String subtitle;
  final bool hasSubtitle;
  final bool errorHeader;

  const HeaderWidget({
    this.title,
    this.chefOnly = false,
    this.subtitle,
    this.hasSubtitle = false,
    this.errorHeader = false,
  });

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> with SingleTickerProviderStateMixin {
  AnimationController _chefAnimationController;
  Animation<dynamic> _curve;

  @override
  void initState() {
    super.initState();
    _chefAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..forward();
    _curve = CurvedAnimation(
      parent: _chefAnimationController,
      curve: Curves.easeInOutBack,
    );

    _chefAnimationController.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          await Future<Duration>.delayed(const Duration(seconds: 3));
          await _chefAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          await Future<Duration>.delayed(const Duration(seconds: 3));
          await _chefAnimationController.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _chefAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.find<SpoonacularService>();
    final themeController = Get.find<ThemeService>();

    if (widget.chefOnly) {
      return Center(
        child: RotationTransition(
          turns: Tween<double>(begin: 0, end: 0.03).animate(_curve),
          child: GestureDetector(
            onLongPress: () {
              themeController.toggleTheme();
              spoonacularController.audioPlayer.resume();
            },
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
                    widget.title,
                    style: MyTextStyles.headline2Text.copyWith(
                      color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                    ),
                  ),
                ),
              ),
              if (widget.hasSubtitle) ...[
                const SizedBox(height: 4),
                SizedBox(
                  width: Get.width * 0.3,
                  child: Obx(
                    () => Text(
                      widget.subtitle,
                      style: MyTextStyles.headline3Text.copyWith(
                        color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          RotationTransition(
            turns: Tween<double>(begin: 0, end: 0.03).animate(_curve),
            child: GestureDetector(
              onLongPress: () {
                themeController.toggleTheme();
                spoonacularController.audioPlayer.resume();
              },
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
                  widget.title,
                  style: MyTextStyles.headline1Text.copyWith(
                    color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                  ),
                ),
              ),
            ),
            if (widget.hasSubtitle) ...[
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width * 0.5,
                child: Obx(
                  () => Text(
                    widget.subtitle,
                    style: MyTextStyles.headline3Text.copyWith(
                      color: themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        RotationTransition(
          turns: Tween<double>(begin: 0, end: 0.03).animate(_curve),
          child: GestureDetector(
            onLongPress: () {
              themeController.toggleTheme();
              spoonacularController.audioPlayer.resume();
            },
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
