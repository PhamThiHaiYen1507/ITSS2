import 'package:json_annotation/json_annotation.dart';

part 'favorite_request.g.dart';

@JsonSerializable()
class FavoriteRequest {
  final String userIp;
  final List<int> favoriteIds;
  FavoriteRequest({required this.userIp, required this.favoriteIds});

  factory FavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteRequestToJson(this);
}
