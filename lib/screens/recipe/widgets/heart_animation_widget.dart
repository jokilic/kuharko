import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/shadows.dart';
import '../../../services/spoonacular_service.dart';
import '../../../services/theme_service.dart';

class HeartAnimationWidget extends StatefulWidget {
  final String heartIcon;

  const HeartAnimationWidget({
    required this.heartIcon,
  });

  @override
  _HeartAnimationWidgetState createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    sizeAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 20,
            end: 10,
          ),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 10,
            end: 20,
          ),
          weight: 1,
        ),
      ],
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spoonacularService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();

    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) {
        if (mounted) {
          spoonacularService.recipeIsFavorited ? animationController.forward() : animationController.reset();
        }

        return PressableDough(
          child: Container(
            width: 74,
            height: 74,
            padding: EdgeInsets.all(sizeAnimation.value),
            decoration: BoxDecoration(
              color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              shape: BoxShape.circle,
              boxShadow: Shadows.myShadow,
            ),
            child: child,
          ),
        );
      },
      child: Image.asset(
        widget.heartIcon,
      ),
    );
  }
}
