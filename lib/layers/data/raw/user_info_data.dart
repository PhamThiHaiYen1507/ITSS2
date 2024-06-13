import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/data/raw/favorite_data.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';

part 'user_info_data.g.dart';

@JsonSerializable()
class UserInfoData {
  int? userId;

  String? name;

  int? age;

  String? avatar;

  String? faculty;

  num? score;

  List<FavoriteData>? favoritesOverlap;

  List<FavoriteData>? favoritesOther;

  UserInfoData();

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
      favoritesOverlap:
          favoritesOverlap?.map((e) => e.toFavoriteModel()).toList() ?? []);
}
