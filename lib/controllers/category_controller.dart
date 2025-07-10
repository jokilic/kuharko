import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/category.dart';
import 'theme_controller.dart';

class CategoryController extends GetxController {
  final themeController = Get.find<ThemeController>();

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
        color: themeController.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.vegan,
        title: 'Vegan',
        color: themeController.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.exotic,
        title: 'Exotic',
        color: themeController.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.spicy,
        title: 'Spicy',
        color: themeController.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.japan,
        title: 'Japan',
        color: themeController.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.seafood,
        title: 'Seafood',
        color: themeController.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.italian,
        title: 'Italian',
        color: themeController.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.chocolate,
        title: 'Chocolate',
        color: themeController.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.cheese,
        title: 'Cheese',
        color: themeController.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.fruit,
        title: 'Fruit',
        color: themeController.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
    ].obs;
  }
}
