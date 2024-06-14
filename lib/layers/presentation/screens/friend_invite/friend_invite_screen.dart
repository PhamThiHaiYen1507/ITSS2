import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/widget/favorite_select_item.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/widget/favorite_similar_item.dart';
import 'package:translate_app/layers/presentation/screens/friend_invite/friend_invite_controller.dart';

class FriendInviteScreen extends StatelessWidget {
  const FriendInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendInviteController>(
        init: FriendInviteController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              centerTitle: true,
              title: const Text('Lời mời kết bạn'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => ListView.builder(
                  itemCount: c.users.length,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Get.bottomSheet(InforUserInvite(c.users[i])),
                          child: Row(
                            children: [
                              ClipRect(
                                  clipBehavior: Clip.none,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: CachedNetworkImage(
                                      imageUrl: c.users[i].avatar ?? '',
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.account_circle),
                                    ),
                                  )),
                              const SizedBox(width: 8),
                              Text(
                                c.users[i].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () => c.acceptInvite(c.users[i]),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffB569AC),
                                          Color(0xff4B164C)
                                        ])),
                                    child: const Text('Chấp nhận',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14))),
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.purple.shade100)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Widget InforUserInvite(UserInfoModel user) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const SizedBox(height: 14),
      Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -250,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      const Color(0xff4B164C),
                      const Color(0xff4B164C).withOpacity(0),
                    ])),
              )),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            height: 300,
            width: Get.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: Column(
              children: [
                Wrap(
                    runSpacing: 8,
                    spacing: 16,
                    children: user.favoritesOverlap
                        .map((e) => InkWell(
                            child: FavoriteSelectItem(
                                favoriteModel: e, isSlected: false)))
                        .toList()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(color: Colors.purple.shade100),
                ),
                Wrap(
                    runSpacing: 8,
                    spacing: 16,
                    children: user.favoritesOther
                        .map((e) => InkWell(
                            child: FavoriteSimilarItem(favoriteModel: e)))
                        .toList()),
              ],
            ),
          )
        ],
      )
    ],
  );
}
