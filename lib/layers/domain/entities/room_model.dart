import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  final String roomId;

  final UserInfoModel friendInfo;

  final List<int> userIds;

  RoomModel(
      {required this.roomId, required this.friendInfo, required this.userIds});

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
