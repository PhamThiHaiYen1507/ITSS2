import 'package:flutter/services.dart';

class Global {
  static Future<void> initialApp() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
  }
}
