import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_list_controller.dart';

class ChatListScreen extends StatelessWidget {
  final int currentUserId;

  const ChatListScreen({super.key, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListController>(
        init: ChatListController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chat List'),
            ),
            body: Obx(
              () => ListView.builder(
                itemCount: c.rooms.length,
                itemBuilder: (context, i) => Text(
                  c.rooms[i].friendInfo.name,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        });
  }
}
