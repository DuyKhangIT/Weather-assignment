import 'dart:async';

import 'package:huynh_duy_khang_home_assignment/core/dtos/weather/weather_dto.dart';

import '../../../global/locator.dart';
import '../../../utils/api_utils.dart';
import '../../dtos/future_weather_list/future_weather_list_dto.dart';
import '../../ui_model/result_ui_model.dart';
import '../interfaces/iweather_service.dart';

class WeatherService implements IWeatherService {
  @override
  Future<DataResultUIModel<WeatherResponseDto?>> getCurrentWeather(
    double lat,
    double lng,
  ) async {
    ResultUIModel result;
    WeatherResponseDto? data;

    result = await ApiUtils.handleApiCall(() async {
      data = await getRestClient().getCurrentWeather(
        lat: lat,
        lon: lng,
        appid: 'faed9bb294de7c6140786effcf73977b',
        units: 'metric',
      );
    });

    return DataResultUIModel(result, data);
  }

  @override
  Future<DataResultUIModel<FutureWeatherListDto?>> getFutureWeather(
    double lat,
    double lng,
  ) async {
    ResultUIModel result;
    FutureWeatherListDto? data;
    result = await ApiUtils.handleApiCall(() async {
      data = await getRestClient().getWeatherFor5Days3HourForecast(
        lat: lat,
        lon: lng,
        appid: 'faed9bb294de7c6140786effcf73977b',
        units: 'metric',
      );
    });

    return DataResultUIModel(result, data);
  }
}
