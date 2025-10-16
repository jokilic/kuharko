import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/category.dart';
import 'theme_service.dart';

class CategoriesService extends GetxService {
  ///
  /// CONSTRUCTOR
  ///

  final ThemeService theme;

  CategoriesService({
    required this.theme,
  });

  ///
  /// REACTIVE VARIABLES
  ///

  final _categories = <Category>[].obs;
  List<Category> get categories => _categories;
  set categories(List<Category> value) => _categories.assignAll(value);

  ///
  /// INIT
  ///

  void init() {
    categories = [
      Category(
        icon: MyIcons.grill,
        title: 'Grill',
        color: theme.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.vegan,
        title: 'Vegan',
        color: theme.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.exotic,
        title: 'Exotic',
        color: theme.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.spicy,
        title: 'Spicy',
        color: theme.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.japan,
        title: 'Japan',
        color: theme.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.seafood,
        title: 'Seafood',
        color: theme.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
      Category(
        icon: MyIcons.italian,
        title: 'Italian',
        color: theme.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.chocolate,
        title: 'Chocolate',
        color: theme.darkTheme ? DarkColors.redColor : LightColors.redColor,
      ),
      Category(
        icon: MyIcons.cheese,
        title: 'Cheese',
        color: theme.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
      ),
      Category(
        icon: MyIcons.fruit,
        title: 'Fruit',
        color: theme.darkTheme ? DarkColors.greenColor : LightColors.greenColor,
      ),
    ].obs;
  }
}
