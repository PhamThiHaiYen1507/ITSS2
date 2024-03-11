part of 'routes.dart';

@immutable
class BottomNavigationRoute extends ShellRouteData {
  const BottomNavigationRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppBottomNavigation(
      currentRoute: state.uri.path,
      child: navigator,
    );
  }
}

@immutable
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@immutable
class HomeMenuScreenRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithFadeTransition(
        context: context, state: state, child: const HomeMenuScreen());
  }
}

@immutable
class HomeScreenRoute extends GoRouteData {
  final int initialIndex;

  const HomeScreenRoute({this.initialIndex = 0});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithFadeTransition(
        context: context,
        state: state,
        child: HomeScreen(initialIndex: initialIndex));
  }
}

@immutable
class FavoriteScreenRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithFadeTransition(
        context: context, state: state, child: const FavoriteScreen());
  }
}

CustomTransitionPage _buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    name: state.path,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
