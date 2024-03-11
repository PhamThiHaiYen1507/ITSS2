import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:translate_app/routes/routes.dart';

class _MenuInfo {
  final IconData icon;
  final String label;
  final String route;

  const _MenuInfo(
      {required this.icon, required this.label, required this.route});
}

const _menus = [
  _MenuInfo(
      icon: Icons.star_rate_rounded, label: 'ưa thích', route: Routes.favorite),
  _MenuInfo(icon: Icons.home, label: 'Trang chủ', route: Routes.home),
  _MenuInfo(icon: Icons.menu, label: 'Cài đặt', route: Routes.home),
];

class AppBottomNavigation extends StatefulWidget {
  final Widget child;
  final String currentRoute;
  const AppBottomNavigation(
      {super.key, required this.child, required this.currentRoute});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  late int currentIndex = _getIndex() ?? 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        context.go(Routes.home_menu);
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onChangedIndex,
          items: _menus
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList(),
        ),
      ),
    );
  }

  void _onChangedIndex(int index) {
    setState(() {
      currentIndex = index;
    });

    context.go(_menus[index].route);
  }

  int? _getIndex() {
    final index =
        _menus.indexWhere((element) => element.route == widget.currentRoute);

    if (index >= 0) {
      return index;
    }
    return null;
  }

  @override
  void didUpdateWidget(covariant AppBottomNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);

    currentIndex = _getIndex() ?? currentIndex;
  }
}
