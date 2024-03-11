// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/splash_screen',
          factory: $SplashScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/home_menu',
          factory: $HomeMenuScreenRouteExtension._fromState,
        ),
        ShellRouteData.$route(
          factory: $BottomNavigationRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomeScreenRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/favorite',
              factory: $FavoriteScreenRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/splash_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeMenuScreenRouteExtension on HomeMenuScreenRoute {
  static HomeMenuScreenRoute _fromState(GoRouterState state) =>
      HomeMenuScreenRoute();

  String get location => GoRouteData.$location(
        '/home_menu',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BottomNavigationRouteExtension on BottomNavigationRoute {
  static BottomNavigationRoute _fromState(GoRouterState state) =>
      const BottomNavigationRoute();
}

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute(
        initialIndex: _$convertMapValue(
                'initial-index', state.uri.queryParameters, int.parse) ??
            0,
      );

  String get location => GoRouteData.$location(
        '/home',
        queryParams: {
          if (initialIndex != 0) 'initial-index': initialIndex.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FavoriteScreenRouteExtension on FavoriteScreenRoute {
  static FavoriteScreenRoute _fromState(GoRouterState state) =>
      FavoriteScreenRoute();

  String get location => GoRouteData.$location(
        '/favorite',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}
