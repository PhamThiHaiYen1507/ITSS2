// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map json) => RoomModel(
      roomId: json['roomId'] as String,
      friendInfo: UserInfoModel.fromJson(
          Map<String, dynamic>.from(json['friendInfo'] as Map)),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'friendInfo': instance.friendInfo.toJson(),
    };
