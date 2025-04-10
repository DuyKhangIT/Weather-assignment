import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../dtos/future_weather_list/future_weather_list_dto.dart';
import '../dtos/weather/weather_dto.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('data/2.5/weather')
  Future<WeatherResponseDto> getCurrentWeather({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String appid,
    @Query('units') required String units,
  });

  @GET('data/2.5/forecast')
  Future<FutureWeatherListDto> getWeatherFor5Days3HourForecast({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String appid,
    @Query('units') required String units,
  });
}
