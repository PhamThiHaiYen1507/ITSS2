import 'package:flutter/material.dart';
import 'package:translate_app/routes/routes.dart';
import 'package:translate_app/styles/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      theme: AppThemes.lightTheme,
    );
  }
}
