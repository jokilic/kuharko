import 'package:flutter/material.dart';

class LightColors {
  static const textColor = Color(0xFF1D1D1B);
  static const bodyColor = Color(0xFFFFFFFF);
  static const backgroundColor = Color(0xFFFEFAEF);

  static const orangeColor = Color(0xFFF17B3E);
  static const greenColor = Color(0xFF689479);
  static const redColor = Color(0xFFBD4141);
  static const purpleColor = Color(0xFFB1A6CA);
  static const blueColor = Color(0xFF00A7E1);

  static const greenRecipeColor = Color(0xFF4DB27A);
  static const yellowRecipeColor = Color(0xFFFFAA38);
  static const blueRecipeColor = Color(0xFF7BAEE3);

  static const overviewRecipeColors = [
    orangeColor,
    greenColor,
    redColor,
    purpleColor,
    blueColor,
  ];

  static Color get randomColor => (List.from(overviewRecipeColors)..shuffle()).first;
}

class DarkColors {
  static const textColor = Color(0xFFFDFDFF);
  static const bodyColor = Color(0xFF1F1D2B);
  static const backgroundColor = Color(0xFF262837);

  static const orangeColor = Color(0xFFF17B3E);
  static const greenColor = Color(0xFF689479);
  static const redColor = Color(0xFFBD4141);
  static const purpleColor = Color(0xFFB1A6CA);
  static const blueColor = Color(0xFF515295);

  static const greenRecipeColor = Color(0xFF4DB27A);
  static const yellowRecipeColor = Color(0xFFFFAA38);
  static const blueRecipeColor = Color(0xFF7BAEE3);

  static const overviewRecipeColors = <Color>[
    orangeColor,
    greenColor,
    redColor,
    purpleColor,
    blueColor,
  ];

  static Color get randomColor => (List.from(overviewRecipeColors)..shuffle()).first;
}
