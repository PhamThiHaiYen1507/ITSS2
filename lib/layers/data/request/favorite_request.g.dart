// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteRequest _$FavoriteRequestFromJson(Map<String, dynamic> json) =>
    FavoriteRequest(
      userIp: json['userIp'] as String,
      favoriteIds: (json['favoriteIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$FavoriteRequestToJson(FavoriteRequest instance) =>
    <String, dynamic>{
      'userIp': instance.userIp,
      'favoriteIds': instance.favoriteIds,
    };
