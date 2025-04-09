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
  });

  @GET('data/2.5/forecast/hourly')
  Future<FutureWeatherListDto> getWeatherFor4Days({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String appid,
  });
}
