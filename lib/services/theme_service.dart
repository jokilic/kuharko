import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends GetxService {
  ///
  /// CONSTRUCTOR
  ///

  final SharedPreferences sharedPreferences;

  ThemeService({
    required this.sharedPreferences,
  });

  ///
  /// REACTIVE VARIABLES
  ///

  final _darkTheme = false.obs;
  bool get darkTheme => _darkTheme.value;
  set darkTheme(bool value) => _darkTheme.value = value;

  ///
  /// INIT
  ///

  Future<void> init() async {
    sharedPreferences.containsKey('darkTheme') ? darkTheme = sharedPreferences.getBool('darkTheme') ?? false : await sharedPreferences.setBool('darkTheme', darkTheme);

    updateStatusBar();
  }

  ///
  /// METHODS
  ///

  Future<void> toggleTheme() async {
    darkTheme = !darkTheme;
    await sharedPreferences.setBool('darkTheme', darkTheme);
    updateStatusBar();
  }

  void updateStatusBar() {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    final brightness = (isIOS ? darkTheme : !darkTheme) ? Brightness.dark : Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
}
