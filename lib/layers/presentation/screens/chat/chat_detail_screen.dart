import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/presentation/screens/chat/chat_detail_controller.dart';
import 'package:translate_app/services/global_service.dart';

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
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Row(
                        mainAxisAlignment: c.messages[i].user.userId !=
                                GlobalService.instance.userIdFromServer
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          if (c.messages[i].user.userId !=
                              GlobalService.instance.userIdFromServer)
                            const Icon(Icons.account_circle, size: 40),
                          const SizedBox(width: 8),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: c.messages[i].user.userId !=
                                          GlobalService
                                              .instance.userIdFromServer
                                      ? Colors.grey.shade300
                                      : const Color(0xff4B164C)),
                              child: Text(message.message,
                                  style: TextStyle(
                                      color: c.messages[i].user.userId !=
                                              GlobalService
                                                  .instance.userIdFromServer
                                          ? Colors.black
                                          : Colors.white))),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: c.message,
                decoration: InputDecoration(
                  hoverColor: Colors.purple,
                  focusColor: Colors.purple,
                  fillColor: Colors.purple,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff4B164C)),
                      borderRadius: BorderRadius.circular(16)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff4B164C)),
                      borderRadius: BorderRadius.circular(16)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff4B164C)),
                      borderRadius: BorderRadius.circular(16)),
                  suffixIcon: IconButton(
                      onPressed: c.sendMessage,
                      icon: const Icon(Icons.send, color: Color(0xff4B164C))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
