import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translate_app/generated/assets.gen.dart';
import 'package:translate_app/routes/routes.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.splash.path,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () =>
                      const HomeScreenRoute(initialIndex: 0).go(context),
                  child: SvgPicture.asset(Assets.svg.translateButton)),
              const SizedBox(height: 48),
              GestureDetector(
                  onTap: () =>
                      const HomeScreenRoute(initialIndex: 1).go(context),
                  child: SvgPicture.asset(Assets.svg.noteButton)),
            ],
          )
        ],
      ),
    );
  }
}
