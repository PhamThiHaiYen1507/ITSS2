// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFriendRequest _$AddFriendRequestFromJson(Map json) => AddFriendRequest(
      firstUserIp: json['firstUserIp'] as String,
      secondUserId: (json['secondUserId'] as num).toInt(),
    );

Map<String, dynamic> _$AddFriendRequestToJson(AddFriendRequest instance) =>
    <String, dynamic>{
      'firstUserIp': instance.firstUserIp,
      'secondUserId': instance.secondUserId,
    };
