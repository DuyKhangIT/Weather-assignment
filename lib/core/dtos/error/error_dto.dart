import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto {
  List<String> errors;
  bool isEmpty;

  ErrorDto({required this.errors, required this.isEmpty});
  factory ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}
