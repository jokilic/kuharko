import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../services/logger_service.dart';

class LoggerInterceptor implements Interceptor {
  final logger = Get.find<LoggerService>();

  ///
  /// METHODS
  ///

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final endpoint = '${err.requestOptions.baseUrl}${err.requestOptions.path}';
    final httpMethod = err.requestOptions.method;
    final statusCode = '${err.response?.statusCode}';
    final error = err.message;
    final responseError = '${err.response?.data}';
    final requestData = '${err.requestOptions.data}';

    logger
      ..e('❌ ERROR FETCHING RESPONSE ❌')
      ..e('--------------------')
      ..e('Endpoint: $endpoint')
      ..e('HTTP Method: $httpMethod')
      ..e('Status code: $statusCode')
      ..e('Error: $error')
      ..e('ResponseError: $responseError')
      ..e('Request:')
      ..logJson(requestData, isError: true)
      ..e('--------------------\n');

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final endpoint = '${options.baseUrl}${options.path}';
    final httpMethod = options.method;
    final requestData = '${options.data}';

    logger
      ..t('🌍 SENDING NETWORK REQUEST 🌍')
      ..t('--------------------')
      ..t('Endpoint: $endpoint')
      ..t('HTTP Method: $httpMethod')
      ..t('Request:')
      ..logJson(requestData)
      ..t('--------------------\n');

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final endpoint = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    final httpMethod = response.requestOptions.method;
    final statusCode = '${response.statusCode}';
    final requestData = '${response.requestOptions.data}';
    final jsonResponse = jsonEncode(response.data);

    logger
      ..t('✅ RESPONSE SUCCESSFULLY FETCHED ✅')
      ..t('--------------------')
      ..t('Endpoint: $endpoint')
      ..t('HTTP Method: $httpMethod')
      ..t('Status code: $statusCode')
      ..t('Request:')
      ..logJson(requestData)
      ..t('Response:')
      ..logJson(jsonResponse)
      ..t('--------------------\n');

    return handler.next(response);
  }
}
