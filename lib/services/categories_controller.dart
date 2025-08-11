import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/category.dart';
import 'theme_service.dart';

class CategoriesService extends GetxService {
  final themeService = Get.find<ThemeService>();

  ///
  /// REACTIVE VARIABLES
  ///

  final _categories = <Category>[].obs;
  List<Category> get categories => _categories;
  set categories(List<Category> value) => _categories.assignAll(value);

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

    categories = [
      Category(
        icon: MyIcons.grill,
        title: 'Grill',
        color: themeService.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.vegan,
        title: 'Vegan',
        color: themeService.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.exotic,
        title: 'Exotic',
        color: themeService.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.spicy,
        title: 'Spicy',
        color: themeService.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.japan,
        title: 'Japan',
        color: themeService.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.seafood,
        title: 'Seafood',
        color: themeService.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.italian,
        title: 'Italian',
        color: themeService.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.chocolate,
        title: 'Chocolate',
        color: themeService.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.cheese,
        title: 'Cheese',
        color: themeService.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.fruit,
        title: 'Fruit',
        color: themeService.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
    ].obs;
  }
}
