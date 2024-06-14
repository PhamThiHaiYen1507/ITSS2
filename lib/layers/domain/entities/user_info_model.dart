import 'package:json_annotation/json_annotation.dart';

import 'favorite_model.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final int userId;

  final String name;

  final int age;

  final String? avatar;

  final String? faculty;

  final num appropriatenessPercent;

  @JsonKey(defaultValue: [])
  final List<FavoriteModel> favoritesOverlap;

  @JsonKey(defaultValue: [])
  final List<FavoriteModel> favoritesOther;

  bool sent;

  UserInfoModel(
      {required this.userId,
      required this.name,
      required this.age,
      this.avatar,
      this.faculty,
      required this.appropriatenessPercent,
      required this.favoritesOther,
      required this.favoritesOverlap,
      required this.sent});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
