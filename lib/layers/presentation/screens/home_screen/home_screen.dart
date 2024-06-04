import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:translate_app/layers/presentation/screens/match_friend_screen/match_friend_screen.dart';

class _MenuInfo {
  final IconData icon;
  final String label;
  final Widget widget;

  const _MenuInfo(
      {required this.icon, required this.label, required this.widget});
}

const _menus = [
  _MenuInfo(
      icon: Icons.add_reaction_sharp,
      label: 'Kết bạn',
      widget: MatchFriendScreen()),
  _MenuInfo(icon: Icons.chat_sharp, label: 'Tin nhắn', widget: SizedBox()),
  _MenuInfo(
      icon: Icons.inventory_outlined, label: 'Lời mời', widget: SizedBox()),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() => _menus[controller.currentIndex.value].widget),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                onTap: (value) => controller.currentIndex.value = value,
                items: _menus
                    .map((e) => BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        activeIcon:
                            Icon(e.icon, color: const Color(0xff4B164C)),
                        icon: Icon(e.icon),
                        label: e.label))
                    .toList(),
              )),
        );
      },
    );
  }
}
