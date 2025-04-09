import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../dtos/weather/weather_dto.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('data/2.5/weather') // test
  Future<WeatherResponseDto> getSaleLocations({
    @Path('serial') required String deviceSerial,
    @Query('lat') required double lat,
    @Query('lon') required double lng,
    @Query('API key') required double apiKey,
  });
}
