import 'package:flutter/material.dart';

class MyColors {
  static const Color textColor = Color(0xFF1D1D1B);
  static const Color bodyColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFFEFAEF);
  static const Color orangeColor = Color(0xFFF17B3E);
  static const Color greenColor = Color(0xFF689479);
  static const Color redColor = Color(0xFFBD4141);
  static const Color purpleColor = Color(0xFFB1A6CA);
  static const Color blueColor = Color(0xFF00A7E1);

  static List<Color> overviewRecipeColors = [
    orangeColor,
    greenColor,
    redColor,
    purpleColor,
    blueColor,
  ];

  static Color get randomColor => (overviewRecipeColors..shuffle()).first;
}