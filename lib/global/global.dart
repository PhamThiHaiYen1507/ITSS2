import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:translate_app/firebase_options.dart';

class Global {
  static Future<void> initialApp() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
