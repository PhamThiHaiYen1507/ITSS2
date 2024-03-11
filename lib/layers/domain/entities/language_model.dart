import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel {
  final String name;
  final String code;
  final bool isRecent;
  final bool isDownloaded;
  final bool isDownloadable;
  LanguageModel(this.name, this.code, this.isRecent, this.isDownloaded,
      this.isDownloadable);

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
