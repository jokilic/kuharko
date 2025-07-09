import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' hide Response;

import '../util/logger_interceptor.dart';
import '../widgets/error_dialog.dart';

class Api {
  final String baseUrl = 'https://api.spoonacular.com';
  final String apiKey = dotenv.env['APIKEY'];

  final Dio _dio = Dio()..interceptors.add(LoggerInterceptor());

  Future<Response<dynamic>> get(String path) async {
    try {
      final Response<dynamic> response = await _dio.get('$baseUrl/${path}apiKey=$apiKey');
      return response;
    } catch (e) {
      await Get.dialog(ErrorDialog());
      return null;
    }
  }

  Future<Response<dynamic>> post(String path, {Map<String, dynamic> params}) async {
    try {
      final Response<dynamic> response = await _dio.post(
        path,
        data: jsonEncode(params),
      );
      return response;
    } catch (e) {
      return null;
    }
  }
}
