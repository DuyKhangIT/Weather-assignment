import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiLogInterceptor extends InterceptorsWrapper {
  final jsonEncoder = const JsonEncoder.withIndent('  ');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    debugPrint('ACTION - $method  ${options.uri}');
    debugPrint('INFO - Headers: ${jsonEncoder.convert(options.headers)}');
    try {
      final json = jsonEncoder.convert(options.data);
      debugPrint('INFO - Data: $json\n');
    } catch (error) {
      debugPrint('ERROR PARE JSON - $error');
      debugPrint('INFO - Data: ${options.data.toString()}\n');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '''INFO - ${response.requestOptions.method.toUpperCase()} ${response.requestOptions.uri} - ${response.statusCode}''');
    final json = jsonEncoder.convert(response.data);
    debugPrint(
        """INFO - Response: ${(json.length > 2500) ? "${json.substring(0, 2500)}..." : json}\n""");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        '''ERROR - ${err.requestOptions.method.toUpperCase()} ${err.requestOptions.uri} - ${err.response?.statusCode}''');
    debugPrint('ERROR - ${err.error}');
    final json = jsonEncoder.convert(err.response?.data);
    debugPrint(
        """ERROR - Response: ${(json.length > 2500) ? "${json.substring(0, 2500)}..." : json}\n""");

    return super.onError(err, handler);
  }
}
