import 'package:huynh_duy_khang_home_assignment/core/dtos/weather/weather_dto.dart';

import '../../ui_model/result_ui_model.dart';

abstract class IWeatherService {
  Future<DataResultUIModel<WeatherResponseDto?>> getCurrentWeather();
}
