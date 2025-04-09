// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_weather_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FutureWeatherItemDto _$FutureWeatherItemDtoFromJson(
        Map<String, dynamic> json) =>
    FutureWeatherItemDto(
      main: TemperatureDto.fromJson(json['main'] as Map<String, dynamic>),
      dt_txt: DateTime.parse(json['dt_txt'] as String),
    );

Map<String, dynamic> _$FutureWeatherItemDtoToJson(
        FutureWeatherItemDto instance) =>
    <String, dynamic>{
      'main': instance.main.toJson(),
      'dt_txt': instance.dt_txt.toIso8601String(),
    };
