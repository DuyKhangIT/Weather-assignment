import 'package:json_annotation/json_annotation.dart';

import '../temperature/temperature_dto.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponseDto {
  final int id;
  final String name;
  final TemperatureDto main;

  WeatherResponseDto({
    required this.id,
    required this.name,
    required this.main,
  });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseDtoToJson(this);
}
