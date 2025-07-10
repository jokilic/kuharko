import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../util/env.dart';
import '../util/logger_interceptor.dart';
import '../widgets/error_dialog.dart';

class Api {
  final baseUrl = 'https://api.spoonacular.com';
  final apiKey = Env.apiKey;

  final dio = Dio()..interceptors.add(LoggerInterceptor());

  Future<Response> get(String path) async {
    try {
      final response = await dio.get('$baseUrl/${path}apiKey=$apiKey');
      return response;
    } catch (e) {
      await Get.dialog(ErrorDialog());
      return null;
    }
  }
}
