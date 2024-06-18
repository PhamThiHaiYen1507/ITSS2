import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/data/raw/user_info_data.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';

part 'room_data.g.dart';

@JsonSerializable()
class RoomData {
  String? roomId;

  List<UserInfoData>? userInRoom;

  RoomData({this.roomId, this.userInRoom});

  factory RoomData.fromJson(Map<String, dynamic> json) =>
      _$RoomDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDataToJson(this);
}
