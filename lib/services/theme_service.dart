import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends GetxService {
  ///
  /// REACTIVE VARIABLES
  ///

  final _darkTheme = false.obs;
  bool get darkTheme => _darkTheme.value;
  set darkTheme(bool value) => _darkTheme.value = value;

  ///
  /// VARIABLES
  ///

  late final SharedPreferences sharedPreferences;

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

    sharedPreferences = await SharedPreferences.getInstance();

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
    final brightness = darkTheme ? Brightness.dark : Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      ),
    );
  }
}
