import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../services/theme_service.dart';
import './colors.dart';

class Shadows {
  static List<BoxShadow> get myShadow => [
    BoxShadow(
      color: Get.find<ThemeService>().darkTheme ? DarkColors.blueColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
      spreadRadius: 2,
      blurRadius: 10,
      offset: const Offset(3, 3),
    ),
  ];
}
