// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageData _$MessageDataFromJson(Map json) => MessageData()
  ..messageId = json['messageId'] as String?
  ..user = json['user'] == null
      ? null
      : UserInfoData.fromJson(Map<String, dynamic>.from(json['user'] as Map))
  ..message = json['message'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'user': instance.user?.toJson(),
      'message': instance.message,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
