import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/data/raw/favorite_data.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';

part 'user_info_data.g.dart';

@JsonSerializable()
class UserInfoData {
  @JsonKey(name: 'id')
  int? userId;

  String? name;

  int? age;

  String? avatar;

  String? faculty;

  num? score;

  List<FavoriteData>? favoritesOverlap;

  List<FavoriteData>? favoritesOther;

  bool? sent;

  UserInfoData({
    this.age,
    this.avatar,
    this.faculty,
    this.favoritesOther,
    this.favoritesOverlap,
    this.name,
    this.score,
    this.sent,
    this.userId,
  });

  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDataToJson(this);

  UserInfoModel toUserInfoModel() => UserInfoModel(
      userId: userId ?? -1,
      name: name ?? '',
      age: age ?? 0,
      avatar: avatar,
      faculty: faculty,
      appropriatenessPercent: score ?? 0,
      favoritesOther:
          favoritesOther?.map((e) => e.toFavoriteModel()).toList() ?? [],
      sent: sent ?? false,
      favoritesOverlap:
          favoritesOverlap?.map((e) => e.toFavoriteModel()).toList() ?? []);
}
