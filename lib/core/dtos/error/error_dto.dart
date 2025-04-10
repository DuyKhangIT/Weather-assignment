import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto {
  List<String> errors;

  ErrorDto({required this.errors});
  factory ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}
