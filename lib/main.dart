import 'package:flutter/material.dart';
import 'package:translate_app/config.dart';
import 'package:translate_app/global/global.dart';

import 'app/app.dart';

void main() async {
  setAppDevelopment();
  WidgetsFlutterBinding.ensureInitialized();

  await Global.initialApp();

  runApp(const App());
}
