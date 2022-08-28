import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import './colors.dart';
import '../controllers/theme_controller.dart';

class Shadows {
  static List<BoxShadow> get myShadow {
    final ThemeController _themeController = Get.find<ThemeController>();

    return <BoxShadow>[
      BoxShadow(
        color: _themeController.darkTheme ? DarkColors.blueColor.withOpacity(0.1) : LightColors.textColor.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 10,
        offset: const Offset(3, 3),
      ),
    ];
  }
}
