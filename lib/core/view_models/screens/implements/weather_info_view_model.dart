import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/core/services/interfaces/iweather_service.dart';
import 'package:huynh_duy_khang_home_assignment/core/ui_model/current_weather_ui_model.dart';
import 'package:huynh_duy_khang_home_assignment/core/ui_model/future_weather_ui_model.dart';

import '../../../../global/locator.dart';
import '../interfaces/iweather_info_view_model.dart';

class WeatherInfoViewModel extends ChangeNotifier
    implements IWeatherInfoViewModel {
  final _weatherService = locator<IWeatherService>();

  String _errorMessage = '';
  @override
  String? get errorMessage => _errorMessage;
  bool _hasError = false;
  @override
  bool get hasError => _hasError;

  bool _isLoading = false;
  @override
  bool get isLoading => _isLoading;

  CurrentWeatherUiModel? _currentWeatherInfo;
  @override
  CurrentWeatherUiModel? get weatherInfo => _currentWeatherInfo;

  List<FutureWeatherUiModel>? _futureWeatherUiModel;
  @override
  List<FutureWeatherUiModel>? get futureWeather => _futureWeatherUiModel;

  @override
  Future<void> fetchWeatherInfo() async {
    try {
      _isLoading = true;
      _hasError = false;
      final result = await _weatherService.getCurrentWeather();
      if (result.isSuccess && result.data != null) {
        _currentWeatherInfo = CurrentWeatherUiModel(
          cityName: result.data!.name,
          temperature: result.data!.main.temp,
        );
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  Future<void> fetchFutureWeather() async {
    try {
      _isLoading = true;
      _hasError = false;
      final result = await _weatherService.getFutureWeather();
      if (result.isSuccess && result.data != null) {
        _futureWeatherUiModel = result.data!.list
            .map((e) => FutureWeatherUiModel(
                  dayOfWeek: e.dt_txt,
                  temperature: e.main.temp,
                ))
            .toList();
        _futureWeatherUiModel = pickOneItemPerDay(_futureWeatherUiModel!);
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<FutureWeatherUiModel> pickOneItemPerDay(
      List<FutureWeatherUiModel> list) {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);

    final Map<int, FutureWeatherUiModel> selected = {};

    for (final item in list) {
      final itemDate = DateTime(
        item.dayOfWeek.year,
        item.dayOfWeek.month,
        item.dayOfWeek.day,
      );
      final diffDays = itemDate.difference(startDate).inDays;

      if (diffDays >= 0 && diffDays < 4) {
        selected.putIfAbsent(diffDays, () {
          return FutureWeatherUiModel(
            dayOfWeek: item.dayOfWeek,
            temperature:
                item.temperature.roundToDouble(),
          );
        });
      }
      if (selected.length == 4) {
        break;
      }
    }

    return selected.values.toList();
  }
}
