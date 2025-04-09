import 'package:flutter/material.dart';

import '../../../ui_model/current_weather_ui_model.dart';

abstract class IWeatherInfoViewModel extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String? get errorMessage;

  CurrentWeatherUiModel? get weatherInfo;

  Future<void> fetchWeatherInfo();
}
