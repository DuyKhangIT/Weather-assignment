// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseDto _$WeatherResponseDtoFromJson(Map<String, dynamic> json) =>
    WeatherResponseDto(
      id: json['id'] as String,
      name: json['name'] as String,
      temperature: (json['temperature'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherResponseDtoToJson(WeatherResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperature': instance.temperature,
    };
