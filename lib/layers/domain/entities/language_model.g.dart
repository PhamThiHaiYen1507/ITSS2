// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      json['name'] as String,
      json['code'] as String,
      json['isRecent'] as bool,
      json['isDownloaded'] as bool,
      json['isDownloadable'] as bool,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'isRecent': instance.isRecent,
      'isDownloaded': instance.isDownloaded,
      'isDownloadable': instance.isDownloadable,
    };
