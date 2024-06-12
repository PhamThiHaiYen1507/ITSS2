import 'package:flutter/material.dart';
import 'package:translate_app/config.dart';

import 'app/app.dart';

void main() {
  setAppDevelopment();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
