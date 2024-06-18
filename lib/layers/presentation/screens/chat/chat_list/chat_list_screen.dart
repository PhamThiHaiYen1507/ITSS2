import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/presentation/screens/chat/chat_detail_screen.dart';

import 'chat_list_controller.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListController>(
        init: ChatListController(),
        builder: (c) {
          return Scaffold(
            backgroundColor: const Color(0xff4B164C),
            appBar: AppBar(
              leading: const SizedBox(),
              centerTitle: true,
              title: const Text('Tin nhắn'),
            ),
            body: Obx(
              () => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bạn bè hiện tại',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: c.users.length,
                            itemBuilder: (context, i) => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: CachedNetworkImage(
                                      imageUrl: c.users[i].avatar ?? '',
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.account_circle,
                                              size: 70),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    c.users[i].name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: ListView.builder(
                        itemCount: c.rooms.length,
                        itemBuilder: (context, i) => InkWell(
                          onTap: () =>
                              Get.to(() => ChatDetailScreen(room: c.rooms[i])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.account_circle, size: 40),
                                    const SizedBox(width: 8),
                                    Text(
                                      c.rooms[i].friendInfo.name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.black45)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
