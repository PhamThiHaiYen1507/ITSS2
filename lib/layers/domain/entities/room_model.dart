import 'package:json_annotation/json_annotation.dart';

import 'user_info_model.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  final String roomId;

  final UserInfoModel friendInfo;

  RoomModel({required this.roomId, required this.friendInfo});

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
