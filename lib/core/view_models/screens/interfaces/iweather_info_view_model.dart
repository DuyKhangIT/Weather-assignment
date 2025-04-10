import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/core/ui_model/future_weather_ui_model.dart';

import '../../../ui_model/current_weather_ui_model.dart';

abstract class IWeatherInfoViewModel extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String? get errorMessage;

  CurrentWeatherUiModel? get weatherInfo;

  List<FutureWeatherUiModel>? get futureWeather;

  Future<void> init();
  Future<void> fetchWeatherInfo();
  Future<void> fetchFutureWeather();
}
