import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    home: BottomNavigation(),
  );
}
