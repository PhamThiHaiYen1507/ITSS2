import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/raw/message_data.dart';
import 'package:translate_app/layers/data/repository/chat_repository_impl.dart';
import 'package:translate_app/layers/domain/entities/message_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/chat_repository.dart';
import 'package:translate_app/services/global_service.dart';

class ChatDetailController extends GetxController {
  final String roomId;

  final GlobalService g = Get.find();

  final ChatRepository _chatRepository = ChatRepositoryImpl();

  final Rx<List<MessageModel>> _messages = Rx([]);

  final TextEditingController message = TextEditingController();

  ChatDetailController(this.roomId);

  List<MessageModel> get messages => _messages.value;

  late final DatabaseReference messagesListRef =
      FirebaseDatabase.instance.ref('messages').child(roomId);

  @override
  void onInit() {
    messagesListRef.onChildAdded.listen((event) {
      _messages.update(
        (val) {
          val?.insert(
            0,
            MessageData.fromJson(Map.from(event.snapshot.value as Map))
                .toMessageModel(),
          );
        },
      );
    });
    super.onInit();
  }

  void sendMessage() {
    FocusManager.instance.primaryFocus?.unfocus();

    _chatRepository.sendMessage(
      roomId: roomId,
      message: MessageModel.init(
        message: message.text,
        user: UserInfoModel(
            userId: GlobalService.instance.userIdFromServer,
            name: '',
            age: 0,
            appropriatenessPercent: 0,
            favoritesOther: [],
            favoritesOverlap: [],
            sent: true),
      ),
    );

    message.clear();
  }

  @override
  void onClose() {
    message.dispose();
    super.onClose();
  }
}
