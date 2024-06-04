import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translate_app/generated/assets.gen.dart';
import 'package:translate_app/global/global.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/favorite_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      backgroundColor: Colors.white,
      asyncNavigationCallback: () async {
        await Global.initialApp();
        await Future.delayed(const Duration(milliseconds: 2000))
            .then((value) => Get.to(() => const FavoriteScreen()));
      },
      splashScreenBody: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.splash.path,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svg.splashLogo),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitFadingCircle(
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text('Loading...')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
