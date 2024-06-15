// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomData _$RoomDataFromJson(Map json) => RoomData(
      roomId: json['roomId'] as String?,
      userInRoom: (json['userInRoom'] as List<dynamic>?)
          ?.map(
              (e) => UserInfoData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$RoomDataToJson(RoomData instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'userInRoom': instance.userInRoom?.map((e) => e.toJson()).toList(),
    };
