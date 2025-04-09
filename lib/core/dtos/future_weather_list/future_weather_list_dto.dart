import 'package:json_annotation/json_annotation.dart';

import '../future_weather_item/future_weather_item_dto.dart';

part 'future_weather_list_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class FutureWeatherListDto {
  final String cod;
  final List<FutureWeatherItemDto> list;

  FutureWeatherListDto({
    required this.cod,
    required this.list,
  });

  factory FutureWeatherListDto.fromJson(Map<String, dynamic> json) =>
      _$FutureWeatherListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FutureWeatherListDtoToJson(this);
}
