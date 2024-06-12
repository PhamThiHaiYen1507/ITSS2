// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoData _$UserInfoDataFromJson(Map<String, dynamic> json) => UserInfoData()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..age = (json['age'] as num?)?.toInt()
  ..avatar = json['avatar'] as String?
  ..faculty = json['faculty'] as String?
  ..score = json['score'] as num?
  ..favoritesOverlap = (json['favoritesOverlap'] as List<dynamic>?)
      ?.map((e) => FavoriteData.fromJson(e as Map<String, dynamic>))
      .toList()
  ..favoritesOther = (json['favoritesOther'] as List<dynamic>?)
      ?.map((e) => FavoriteData.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$UserInfoDataToJson(UserInfoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'avatar': instance.avatar,
      'faculty': instance.faculty,
      'score': instance.score,
      'favoritesOverlap': instance.favoritesOverlap,
      'favoritesOther': instance.favoritesOther,
    };
