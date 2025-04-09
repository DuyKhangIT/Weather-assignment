// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_weather_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FutureWeatherListDto _$FutureWeatherListDtoFromJson(
        Map<String, dynamic> json) =>
    FutureWeatherListDto(
      cod: json['cod'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => FutureWeatherItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FutureWeatherListDtoToJson(
        FutureWeatherListDto instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'list': instance.list.map((e) => e.toJson()).toList(),
    };
