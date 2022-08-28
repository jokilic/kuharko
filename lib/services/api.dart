import 'dart:convert';
// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../widgets/error_dialog.dart';

class Api {
  final String baseUrl = 'https://api.spoonacular.com';

  /// TODO: Hide this key with `flutter_dotenv`
  final String apiKey = '49da29911b994ad4b0eb9c0e4ca5c974';

  final Dio _dio = Dio();

  Future<Response<dynamic>> get(String path) async {
    try {
      final Response<dynamic> response = await _dio.get('$baseUrl/${path}apiKey=$apiKey');
      // log('[DIO] $response');
      return response;
    } catch (e) {
      // log('[DIO] $e');
      await getx.Get.dialog(ErrorDialog());
      return null;
    }
  }

  Future<Response<dynamic>> post(String path, {Map<String, dynamic> params}) async {
    try {
      final Response<dynamic> response = await _dio.post(
        path,
        data: jsonEncode(params),
      );
      // log('[DIO] $response');
      return response;
    } catch (e) {
      // log('[DIO] $e');
      return null;
    }
  }
}
