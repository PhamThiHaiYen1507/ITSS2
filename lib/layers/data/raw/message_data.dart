import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/data/raw/user_info_data.dart';
import 'package:translate_app/layers/domain/entities/message_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:uuid/uuid.dart';

part 'message_data.g.dart';

@JsonSerializable()
class MessageData {
  String? messageId;

  UserInfoData? user;

  String? message;

  DateTime? createdAt;

  MessageData();

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDataToJson(this);

  MessageModel toMessageModel() => MessageModel(
        messageId: messageId ?? const Uuid().v4(),
        user: user?.toUserInfoModel() ?? UserInfoModel.empty(),
        message: message ?? '',
        createdAt: createdAt ?? DateTime.now(),
      );
}
