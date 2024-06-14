// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultData _$ResultDataFromJson(Map json) => ResultData()
  ..result = json['result'] as bool?
  ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'result': instance.result,
      'id': instance.id,
    };
