import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:translate_app/config.dart';

import 'app/app.dart';

void main() async {
  setAppDevelopment();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}
