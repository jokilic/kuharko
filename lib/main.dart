import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import './screens/screens.dart';
import 'services/logger_service.dart';

Future<void> main() async {
  /// Load `flutter_dotenv` (for the API key)
  await dotenv.load();

  /// Initialize required services
  Get.put(LoggerService());

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
        getPages: <GetPage>[
          GetPage(name: BottomNavigation.routeName, page: () => BottomNavigation()),
          GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
          GetPage(name: SearchScreen.routeName, page: () => SearchScreen()),
          GetPage(name: CategoriesScreen.routeName, page: () => CategoriesScreen()),
          GetPage(name: FavoritesScreen.routeName, page: () => FavoritesScreen()),
          GetPage(name: RecipeScreen.routeName, page: () => RecipeScreen()),
          GetPage(name: ResultsScreen.routeName, page: () => ResultsScreen()),
        ],
      );
}
