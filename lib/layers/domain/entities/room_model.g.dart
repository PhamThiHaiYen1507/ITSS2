// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map json) => RoomModel(
      roomId: json['roomId'] as String,
      friendInfo: UserInfoModel.fromJson(
          Map<String, dynamic>.from(json['friendInfo'] as Map)),
      userIds: (json['userIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'friendInfo': instance.friendInfo.toJson(),
      'userIds': instance.userIds,
    };
