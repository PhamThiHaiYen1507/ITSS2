import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';

part 'favorite_data.g.dart';

@JsonSerializable()
class FavoriteData {
  int? id;
  String? name;
  String? url;
  FavoriteData({this.id, this.name, this.url});

  factory FavoriteData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteDataToJson(this);

  FavoriteModel toFavoriteModel() {
    return FavoriteModel(id: id ?? 0, name: name ?? '', url: url ?? '');
  }
}
