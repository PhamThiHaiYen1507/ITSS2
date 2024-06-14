import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/repository/favorite_repository_impl.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/favorite_controller.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/widget/favorite_select_item.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/widget/favorite_similar_item.dart';
import 'package:translate_app/layers/presentation/screens/home_screen/home_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        init: FavoriteController(FavoriteRepositoryImpl()),
        builder: (controller) {
          return Scaffold(
              backgroundColor: const Color(0xffF2F2F2),
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text('Lựa chọn sở thích',
                    style: TextStyle(color: Color(0xff4B164C))),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(0.1))
                                ],
                                color: Colors.white,
                                border: const Border(
                                    top: BorderSide(color: Color(0xffF2F2F2)))),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Bạn đã chọn',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Obx(() => Text(
                                        controller
                                            .favoriteListSelected.value.length
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)))
                                  ],
                                ),
                                Obx(() => Wrap(
                                    runSpacing: 8,
                                    spacing: 8,
                                    children: controller
                                        .favoriteListSelected.value
                                        .map((e) => InkWell(
                                            onTap: () =>
                                                controller.onRemoveFavorite(e),
                                            child: FavoriteSelectItem(
                                                isSlected: true,
                                                favoriteModel: e)))
                                        .toList()))
                              ],
                            )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(() => Wrap(
                              runSpacing: 8,
                              spacing: 16,
                              children: controller.favoriteList.value
                                  .map((e) => InkWell(
                                      onTap: () =>
                                          controller.onSelectedFavorite(e),
                                      child: FavoriteSimilarItem(
                                          favoriteModel: e)))
                                  .toList())),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: InkWell(
                      onTap: () {
                        controller.updateFavorite();
                        Get.to(() => const HomeScreen());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(colors: [
                                Color(0xffB569AC),
                                Color(0xff4B164C)
                              ])),
                          child: const Text('Xác nhận',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700))),
                    ),
                  )
                ],
              ));
        });
  }
}
