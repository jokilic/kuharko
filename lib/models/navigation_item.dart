import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/search_screen.dart';
import '../services/theme_service.dart';

class NavigationItem {
  final Widget page;
  final String title;
  final Widget icon;
  final Widget iconActive;

  NavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.iconActive,
  });

  @override
  String toString() => 'NavigationItem(page: $page, title: $title, icon: $icon, iconActive: $iconActive)';

  @override
  bool operator ==(covariant NavigationItem other) {
    if (identical(this, other)) {
      return true;
    }

    return other.page == page && other.title == title && other.icon == icon && other.iconActive == iconActive;
  }

  @override
  int get hashCode => page.hashCode ^ title.hashCode ^ icon.hashCode ^ iconActive.hashCode;

  static List<NavigationItem> get items {
    final themeService = Get.find<ThemeService>();

    return [
      NavigationItem(
        page: HomeScreen(),
        icon: Image.asset(
          MyIcons.home,
          width: 40,
          height: 40,
          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.2) : LightColors.backgroundColor.withValues(alpha: 0.2),
        ),
        iconActive: Image.asset(
          MyIcons.home,
          width: 48,
          height: 48,
          color: themeService.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Home',
      ),
      NavigationItem(
        page: SearchScreen(),
        icon: Image.asset(
          MyIcons.search,
          width: 40,
          height: 40,
          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.2) : LightColors.backgroundColor.withValues(alpha: 0.2),
        ),
        iconActive: Image.asset(
          MyIcons.search,
          width: 48,
          height: 48,
          color: themeService.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Search',
      ),
      NavigationItem(
        page: CategoriesScreen(),
        icon: Image.asset(
          MyIcons.categories,
          width: 40,
          height: 40,
          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.2) : LightColors.backgroundColor.withValues(alpha: 0.2),
        ),
        iconActive: Image.asset(
          MyIcons.categories,
          width: 48,
          height: 48,
          color: themeService.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Categories',
      ),
      NavigationItem(
        page: FavoritesScreen(),
        icon: Image.asset(
          MyIcons.heart,
          width: 40,
          height: 40,
          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.2) : LightColors.backgroundColor.withValues(alpha: 0.2),
        ),
        iconActive: Image.asset(
          MyIcons.heart,
          width: 48,
          height: 48,
          color: themeService.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
        ),
        title: 'Favorites',
      ),
    ];
  }
}
