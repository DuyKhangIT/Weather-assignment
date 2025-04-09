import 'package:json_annotation/json_annotation.dart';

part 'temperature_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TemperatureDto {
  final double temp;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  TemperatureDto({
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
  });

  factory TemperatureDto.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureDtoToJson(this);
}
