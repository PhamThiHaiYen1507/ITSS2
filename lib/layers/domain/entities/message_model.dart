import 'package:json_annotation/json_annotation.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:uuid/uuid.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String messageId;

  final UserInfoModel user;

  final String message;

  final DateTime createdAt;

  MessageModel({
    required this.messageId,
    required this.user,
    required this.message,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  factory MessageModel.init(
          {required String message, required UserInfoModel user}) =>
      MessageModel(
        messageId: const Uuid().v4(),
        createdAt: DateTime.now(),
        message: message,
        user: user,
      );

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
