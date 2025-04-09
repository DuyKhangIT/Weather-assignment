// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureDto _$TemperatureDtoFromJson(Map<String, dynamic> json) =>
    TemperatureDto(
      temp: (json['temp'] as num).toDouble(),
      temp_min: (json['temp_min'] as num).toDouble(),
      temp_max: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$TemperatureDtoToJson(TemperatureDto instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
