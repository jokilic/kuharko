import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListView extends StatelessWidget {
  final int index;
  final Widget child;
  final bool fastAnimations;

  const AnimatedListView({
    required this.index,
    required this.child,
    this.fastAnimations = false,
  });

  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredList(
    position: index,
    duration: fastAnimations ? const Duration(milliseconds: 200) : const Duration(milliseconds: 400),
    child: SlideAnimation(
      curve: Curves.easeIn,
      duration: fastAnimations ? const Duration(milliseconds: 200) : const Duration(milliseconds: 400),
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
