import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/presentation/screens/chat/chat_detail_controller.dart';

class ChatDetailScreen extends StatelessWidget {
  final RoomModel room;
  const ChatDetailScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailController>(
      init: ChatDetailController(room.roomId),
      builder: (c) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(room.friendInfo.name),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  reverse: true,
                  itemCount: c.messages.length,
                  itemBuilder: (context, i) {
                    final message = c.messages[i];
                    return Text(message.message);
                  },
                ),
              ),
            ),
            TextField(
              controller: c.message,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: c.sendMessage, icon: const Icon(Icons.send)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
