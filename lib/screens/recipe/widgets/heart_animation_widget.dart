import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/shadows.dart';
import '../../../controllers/spoonacular_controller.dart';
import '../../../controllers/theme_controller.dart';

class HeartAnimationWidget extends StatefulWidget {
  final String heartIcon;

  const HeartAnimationWidget({
    @required this.heartIcon,
  });

  @override
  _HeartAnimationWidgetState createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  final SpoonacularController _spoonacularController = Get.find<SpoonacularController>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _sizeAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 20.0,
            end: 10.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 10.0,
            end: 20.0,
          ),
          weight: 1,
        ),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        _spoonacularController.recipeIsFavorited ? _animationController.forward() : _animationController.reset();

        return PressableDough(
          child: Container(
            width: 74.0,
            height: 74.0,
            padding: EdgeInsets.all(_sizeAnimation.value),
            decoration: BoxDecoration(
              color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
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
