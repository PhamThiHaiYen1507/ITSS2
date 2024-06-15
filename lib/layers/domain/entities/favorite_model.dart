import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/data/raw/favorite_data.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  final int id;
  final String name;
  final String url;
  FavoriteModel({required this.id, required this.name, required this.url});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);

  FavoriteData toFavoriteData() => FavoriteData.fromJson(toJson());
}
