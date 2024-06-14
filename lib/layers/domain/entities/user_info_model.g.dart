// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map json) => UserInfoModel(
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      avatar: json['avatar'] as String?,
      faculty: json['faculty'] as String?,
      appropriatenessPercent: json['appropriatenessPercent'] as num,
      favoritesOther: (json['favoritesOther'] as List<dynamic>?)
              ?.map((e) =>
                  FavoriteModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      favoritesOverlap: (json['favoritesOverlap'] as List<dynamic>?)
              ?.map((e) =>
                  FavoriteModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      sent: json['sent'] as bool,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'avatar': instance.avatar,
      'faculty': instance.faculty,
      'appropriatenessPercent': instance.appropriatenessPercent,
      'favoritesOverlap':
          instance.favoritesOverlap.map((e) => e.toJson()).toList(),
      'favoritesOther': instance.favoritesOther.map((e) => e.toJson()).toList(),
      'sent': instance.sent,
    };
