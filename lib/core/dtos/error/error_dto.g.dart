// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) => ErrorDto(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      isEmpty: json['isEmpty'] as bool,
    );

Map<String, dynamic> _$ErrorDtoToJson(ErrorDto instance) => <String, dynamic>{
      'errors': instance.errors,
      'isEmpty': instance.isEmpty,
    };
