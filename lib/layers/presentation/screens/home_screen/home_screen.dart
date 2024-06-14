import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/presentation/screens/chat/chat_list/chat_list_screen.dart';
import 'package:translate_app/layers/presentation/screens/friend_invite/friend_invite_screen.dart';
import 'package:translate_app/layers/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:translate_app/layers/presentation/screens/match_friend_screen/match_friend_screen.dart';
import 'package:translate_app/services/global_service.dart';

class _MenuInfo {
  final IconData icon;
  final String label;

  const _MenuInfo({required this.icon, required this.label});
}

const _menus = [
  _MenuInfo(
    icon: Icons.add_reaction_sharp,
    label: 'Kết bạn',
  ),
  _MenuInfo(
    icon: Icons.chat_sharp,
    label: 'Tin nhắn',
  ),
  _MenuInfo(
    icon: Icons.inventory_outlined,
    label: 'Lời mời',
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() => _getBody(controller.currentIndex.value)),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                backgroundColor: Colors.white,
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

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const MatchFriendScreen();

      case 1:
        return const ChatListScreen();

      case 2:
        return const FriendInviteScreen();
      default:
        return const SizedBox();
    }
  }
}
