import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoggerService extends GetxService {
  ///
  /// VARIABLES
  ///

  Logger logger;

  ///
  /// INIT
  ///

  @override
  void onInit() {
    super.onInit();

    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 3,
        lineLength: 50,
        noBoxingByDefault: true,
      ),
    );
  }

  ///
  /// METHODS
  ///

  /// Verbose log, grey color
  void t(value) => logger.t(value);

  /// 🐛 Debug log, blue color
  void d(value) => logger.d(value);

  /// 💡 Info log, light blue color
  void i(value) => logger.i(value);

  /// ⚠️ Warning log, orange color
  void w(value) => logger.w(value);

  /// ⛔ Error log, red color
  void e(value) => logger.e(value);

  /// 👾 Fatal log, purple color
  void f(value) => logger.f(value);

  /// Logs JSON responses with proper formatting
  void logJson(String data, {bool isError = false}) {
    final object = json.decode(data);
    final prettyString = const JsonEncoder.withIndent('  ').convert(object);
    isError ? e(prettyString) : t(prettyString);
  }
}
