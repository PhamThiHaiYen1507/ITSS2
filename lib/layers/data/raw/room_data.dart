import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/data/raw/user_info_data.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:uuid/uuid.dart';

part 'room_data.g.dart';

@JsonSerializable()
class RoomData {
  String? roomId;

  UserInfoData? friendInfo;

  RoomData();

  factory RoomData.fromJson(Map<String, dynamic> json) =>
      _$RoomDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDataToJson(this);

  RoomModel toRoomModel() => RoomModel(
      roomId: roomId ?? const Uuid().v4(),
      friendInfo: friendInfo?.toUserInfoModel() ??
          UserInfoModel(
              userId: -1,
              name: '',
              age: 0,
              appropriatenessPercent: 0,
              favoritesOther: [],
              favoritesOverlap: [],
              sent: false));
}
