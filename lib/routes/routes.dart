// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:translate_app/layers/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:translate_app/layers/presentation/screens/home_menu_screen/home_menu_screen.dart';
import 'package:translate_app/layers/presentation/screens/home_screen/home_screen.dart';
import 'package:translate_app/layers/presentation/screens/splash_screen/splash_screen.dart';
import 'package:translate_app/layers/presentation/widgets/app_bottom_navigation/app_bottom_navigation.dart';

part 'routes.g.dart';
part 'routes_define.dart';

@TypedGoRoute<MainRoute>(path: '/', routes: [
  TypedGoRoute<SplashScreenRoute>(path: Routes.splash_screen),
  TypedGoRoute<HomeMenuScreenRoute>(path: Routes.home_menu),
  TypedShellRoute<BottomNavigationRoute>(routes: [
    TypedGoRoute<HomeScreenRoute>(path: Routes.home),
    TypedGoRoute<FavoriteScreenRoute>(path: Routes.favorite),
  ])
])
@immutable
class MainRoute extends GoRouteData {}

class Routes {
  static const String splash_screen = '/splash_screen';
  static const String home_menu = '/home_menu';
  static const String home = '/home';
  static const String favorite = '/favorite';

  static final routes = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: splash_screen,
    onException: (context, state, router) {
      log('exception on router: ${state.uri.toString()}', name: 'APP_ROUTER');
    },
    routes: $mainRoute.routes,
  );
}
