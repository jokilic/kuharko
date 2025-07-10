import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
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
  /// METHODS
  ///

  Future<void> toggleTheme() async {
    darkTheme = !darkTheme;
    await sharedPreferences.setBool('darkTheme', darkTheme);
  }

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

      sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.containsKey('darkTheme')
        ? darkTheme = sharedPreferences.getBool('darkTheme')
        : await sharedPreferences.setBool('darkTheme', darkTheme);
  }
}
