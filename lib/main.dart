import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/categories/categories_binding.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/favorites/favorites_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/recipe/recipe_screen.dart';
import 'screens/results/results_screen.dart';
import 'screens/search/search_screen.dart';
import 'services/logger_service.dart';
import 'services/network_service.dart';
import 'services/spoonacular_service.dart';
import 'services/theme_service.dart';
import 'widgets/bottom_navigation.dart';

void main() {
  /// Initialize required services
  Get
    ..put(LoggerService())
    ..put(ThemeService())
    ..put(NetworkService())
    ..put(SpoonacularService());

  /// Run `Kuharko`
  runApp(Kuharko());
}

class Kuharko extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
    title: 'Kuharko',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'VisbyRound',
    ),
    initialRoute: BottomNavigation.routeName,
    getPages: [
      GetPage(
        name: BottomNavigation.routeName,
        page: BottomNavigation.new,
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: HomeScreen.new,
      ),
      GetPage(
        name: SearchScreen.routeName,
        page: SearchScreen.new,
      ),
      GetPage(
        name: CategoriesScreen.routeName,
        page: CategoriesScreen.new,
        binding: CategoriesBinding(),
      ),
      GetPage(
        name: FavoritesScreen.routeName,
        page: FavoritesScreen.new,
      ),
      GetPage(
        name: RecipeScreen.routeName,
        page: RecipeScreen.new,
      ),
      GetPage(
        name: ResultsScreen.routeName,
        page: ResultsScreen.new,
      ),
    ],
  );
}
