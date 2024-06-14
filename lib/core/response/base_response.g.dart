// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map json) => BaseResponse()
  ..data = json['data']
  ..statusCode = (json['statusCode'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
