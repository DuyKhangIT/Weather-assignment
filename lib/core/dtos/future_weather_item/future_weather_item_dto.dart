import 'package:json_annotation/json_annotation.dart';

import '../temperature/temperature_dto.dart';

part 'future_weather_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class FutureWeatherItemDto {
  final TemperatureDto main;
  final DateTime dt_txt;

  FutureWeatherItemDto({
    required this.main,
    required this.dt_txt,
  });

  factory FutureWeatherItemDto.fromJson(Map<String, dynamic> json) =>
      _$FutureWeatherItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FutureWeatherItemDtoToJson(this);
}
