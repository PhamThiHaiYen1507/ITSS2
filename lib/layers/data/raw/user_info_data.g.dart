// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoData _$UserInfoDataFromJson(Map json) => UserInfoData()
  ..userId = (json['userId'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..age = (json['age'] as num?)?.toInt()
  ..avatar = json['avatar'] as String?
  ..faculty = json['faculty'] as String?
  ..score = json['score'] as num?
  ..favoritesOverlap = (json['favoritesOverlap'] as List<dynamic>?)
      ?.map((e) => FavoriteData.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..favoritesOther = (json['favoritesOther'] as List<dynamic>?)
      ?.map((e) => FavoriteData.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$UserInfoDataToJson(UserInfoData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'avatar': instance.avatar,
      'faculty': instance.faculty,
      'score': instance.score,
      'favoritesOverlap':
          instance.favoritesOverlap?.map((e) => e.toJson()).toList(),
      'favoritesOther':
          instance.favoritesOther?.map((e) => e.toJson()).toList(),
    };
