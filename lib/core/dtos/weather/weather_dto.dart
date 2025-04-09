import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponseDto {
  final String id;
  final String name;
  final double temperature;

  WeatherResponseDto({
    required this.id,
    required this.name,
    required this.temperature,
  });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseDtoToJson(this);
}
