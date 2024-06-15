// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map json) => MessageModel(
      messageId: json['messageId'] as String,
      user: UserInfoModel.fromJson(
          Map<String, dynamic>.from(json['user'] as Map)),
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'user': instance.user.toJson(),
      'message': instance.message,
      'createdAt': instance.createdAt.toIso8601String(),
    };
