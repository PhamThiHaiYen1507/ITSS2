import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/widget/favorite_select_item.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/widget/favorite_similar_item.dart';
import 'package:translate_app/layers/presentation/screens/match_friend_screen/match_friend_controller.dart';

class MatchFriendScreen extends StatefulWidget {
  const MatchFriendScreen({super.key});

  @override
  State<MatchFriendScreen> createState() => _MatchFriendScreenState();
}

class _MatchFriendScreenState extends State<MatchFriendScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchFriendController>(
      init: MatchFriendController(),
      builder: (c) => Scaffold(
        body: Obx(
          () => PageView.builder(
            controller: pageController,
            itemCount: c.users.length,
            itemBuilder: (context, i) {
              final user = c.users[i];

              return user.userId != -1
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox.expand(
                          child: CachedNetworkImage(
                            imageUrl: user.avatar ?? '',
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => const Icon(
                              Icons.people,
                              color: Colors.black26,
                              size: 400,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SafeArea(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                      onPressed: () {
                                        c.addFriend(user);
                                        pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff4B164C),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          )),
                                      child: Row(
                                        children: [
                                          Text(user.sent == false
                                              ? 'Add'
                                              : 'Waiting'),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.group_add),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                            Expanded(
                                child: Column(
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
                                                const Color(0xff4B164C)
                                                    .withOpacity(0),
                                              ])),
                                        )),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      height: 300,
                                      width: Get.width,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(32)),
                                      ),
                                      child: Column(
                                        children: [
                                          Wrap(
                                              runSpacing: 8,
                                              spacing: 16,
                                              children: user.favoritesOverlap
                                                  .map((e) => InkWell(
                                                      child: FavoriteSelectItem(
                                                          favoriteModel: e,
                                                          isSlected: false)))
                                                  .toList()),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Divider(
                                                color: Colors.purple.shade100),
                                          ),
                                          Wrap(
                                              runSpacing: 8,
                                              spacing: 16,
                                              children: user.favoritesOther
                                                  .map((e) => InkWell(
                                                      child:
                                                          FavoriteSimilarItem(
                                                              favoriteModel:
                                                                  e)))
                                                  .toList()),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                        Positioned(
                            top: 280,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${user.name},${user.age}',
                                  style: const TextStyle(
                                      fontSize: 32, color: Colors.white),
                                ),
                                Text(
                                  user.faculty ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff4B164C),
                                    border: Border.all(
                                        color: const Color(0xffDD88CF)),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 18.0,
                                        lineWidth: 4.0,
                                        animation: true,
                                        percent:
                                            user.appropriatenessPercent / 100,
                                        center: FittedBox(
                                          child: Text(
                                            "${user.appropriatenessPercent.round()}%",
                                            style: const TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.purple,
                                      ),
                                      const SizedBox(width: 16),
                                      const Text(
                                        'Phù hợp',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Không còn một ai,\n Hãy chọn thêm sở thích để có nhiều bạn bè hơn nhé',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.purple),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xffB569AC),
                                      Color(0xff4B164C)
                                    ])),
                                child: const Text('Chọn lại',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))),
                          ),
                        ],
                      ),
                    ));
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
