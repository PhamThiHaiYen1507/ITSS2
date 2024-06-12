import 'package:json_annotation/json_annotation.dart';

part 'add_friend_request.g.dart';

@JsonSerializable()
class AddFriendRequest {
  final String firstUserIp;
  final int secondUserId;
  AddFriendRequest({required this.firstUserIp, required this.secondUserId});

  factory AddFriendRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFriendRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFriendRequestToJson(this);
}
