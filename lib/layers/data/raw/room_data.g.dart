// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomData _$RoomDataFromJson(Map json) => RoomData()
  ..roomId = json['roomId'] as String?
  ..friendInfo = json['friendInfo'] == null
      ? null
      : UserInfoData.fromJson(
          Map<String, dynamic>.from(json['friendInfo'] as Map));

Map<String, dynamic> _$RoomDataToJson(RoomData instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'friendInfo': instance.friendInfo?.toJson(),
    };
