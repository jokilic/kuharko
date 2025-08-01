import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool fastAnimations;

  const AnimatedColumn({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.fastAnimations = false,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    children: AnimationConfiguration.toStaggeredList(
      duration: fastAnimations ? const Duration(milliseconds: 200) : const Duration(milliseconds: 400),
      childAnimationBuilder: (widget) => SlideAnimation(
        curve: Curves.easeIn,
        duration: fastAnimations ? const Duration(milliseconds: 200) : const Duration(milliseconds: 400),
        child: FadeInAnimation(
          child: widget,
        ),
      ),
      children: children,
    ),
  );
}
