import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import './colors.dart';
import '../services/theme_service.dart';

class Shadows {
  static List<BoxShadow> get myShadow => [
    BoxShadow(
      color: Get.find<ThemeService>().darkTheme ? DarkColors.blueColor.withOpacity(0.1) : LightColors.textColor.withOpacity(0.1),
      spreadRadius: 2,
      blurRadius: 10,
      offset: const Offset(3, 3),
    ),
  ];
}
