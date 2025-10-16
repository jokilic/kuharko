import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/categories_controller.dart';
import '../services/logger_service.dart';
import '../services/network_service.dart';
import '../services/spoonacular_service.dart';
import '../services/theme_service.dart';

Future<void> initializeServices() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final logger = Get.put(LoggerService());

  final theme = await Get.putAsync(
    () async {
      final themeService = ThemeService(
        sharedPreferences: sharedPreferences,
      );
      await themeService.init();
      return themeService;
    },
  );

  final network = Get.put(
    NetworkService(
      logger: logger,
    ),
  );

  await Get.putAsync(
    () async {
      final spoonacularService = SpoonacularService(
        sharedPreferences: sharedPreferences,
        logger: logger,
        network: network,
        theme: theme,
      );
      await spoonacularService.init();
      return spoonacularService;
    },
  );

  await Get.putAsync(
    () async => CategoriesService(
      theme: theme,
    )..init(),
  );
}
