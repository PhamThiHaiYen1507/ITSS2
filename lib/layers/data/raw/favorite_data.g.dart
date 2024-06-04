// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteData _$FavoriteDataFromJson(Map<String, dynamic> json) => FavoriteData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$FavoriteDataToJson(FavoriteData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
