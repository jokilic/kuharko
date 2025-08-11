import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'services/categories_controller.dart';
import 'services/logger_service.dart';
import 'services/network_service.dart';
import 'services/spoonacular_service.dart';
import 'services/theme_service.dart';
import 'util/env.dart';
import 'widgets/bottom_navigation.dart';

Future<void> main() async {
  /// Initialize Flutter related tasks
  WidgetsFlutterBinding.ensureInitialized();

  /// Make sure the orientation is only `portrait`
  unawaited(
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  );

  /// Initialize required services
  Get
    ..put(LoggerService())
    ..put(ThemeService())
    ..put(NetworkService())
    ..put(SpoonacularService())
    ..put(CategoriesService());

  /// Initialize [Sentry] & run [Kuharko]
  await SentryFlutter.init(
    (options) => options
      ..dsn = kDebugMode || kIsWeb ? '' : Env.sentryDsn
      ..debug = kDebugMode,
    appRunner: () => runApp(Kuharko()),
  );
}

class Kuharko extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
    title: 'Kuharko',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'ProductSans',
    ),
    home: BottomNavigation(),
  );
}
