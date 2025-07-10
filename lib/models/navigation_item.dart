import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../controllers/theme_controller.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/search_screen.dart';

class NavigationItem {
  final Widget page;
  final String title;
  final Widget icon;
  final Widget iconActive;

  NavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
    @required this.iconActive,
  });

  static List<NavigationItem> get items {
    final ThemeController _themeController = Get.find<ThemeController>();

    return <NavigationItem>[
      NavigationItem(
        page: HomeScreen(),
        icon: Image.asset(
          MyIcons.home,
          width: 40.0,
          height: 40.0,
          color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.2) : LightColors.backgroundColor.withOpacity(0.2),
        ),
        iconActive: Image.asset(
          MyIcons.home,
          width: 48.0,
          height: 48.0,
          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Home',
      ),
      NavigationItem(
        page: SearchScreen(),
        icon: Image.asset(
          MyIcons.search,
          width: 40.0,
          height: 40.0,
          color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.2) : LightColors.backgroundColor.withOpacity(0.2),
        ),
        iconActive: Image.asset(
          MyIcons.search,
          width: 48.0,
          height: 48.0,
          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Search',
      ),
      NavigationItem(
        page: CategoriesScreen(),
        icon: Image.asset(
          MyIcons.categories,
          width: 40.0,
          height: 40.0,
          color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.2) : LightColors.backgroundColor.withOpacity(0.2),
        ),
        iconActive: Image.asset(
          MyIcons.categories,
          width: 48.0,
          height: 48.0,
          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Categories',
      ),
      NavigationItem(
        page: FavoritesScreen(),
        icon: Image.asset(
          MyIcons.heart,
          width: 40.0,
          height: 40.0,
          color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.2) : LightColors.backgroundColor.withOpacity(0.2),
        ),
        iconActive: Image.asset(
          MyIcons.heart,
          width: 48.0,
          height: 48.0,
          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Favorites',
      ),
    ];
  }
}
