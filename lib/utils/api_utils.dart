import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../core/dtos/error/error_dto.dart';
import '../core/ui_model/result_ui_model.dart';

class ApiUtils {
  static Future<ResultUIModel> handleApiCall(
      Future<void> Function() apiFunction) async {
    ResultUIModel result = ResultUIModel();

    try {
      await apiFunction();
      result.isSuccess = true;
      result.errorMessage = '';
    } on DioException catch (e) {
      log(jsonEncode(e));
      try {
        ErrorDto errorResponse = ErrorDto.fromJson(e.response!.data);
        result.isSuccess = false;
        result.errorMessage =
            errorResponse.errors.firstOrNull ?? "Server Error";
      } catch (e) {
        result.isSuccess = false;
        result.errorMessage = "Server Error";
      }
    } catch (e) {
      log(jsonEncode(e));
      result.isSuccess = false;
      result.errorMessage = "Server Error";
    }

    return result;
  }
}
