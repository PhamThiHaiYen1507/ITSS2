import 'package:flutter/material.dart';

abstract class AppTextStyle {
  ///fontSize: 16, fontWeight: FontWeight.w400
  static TextStyle bodyText =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  ///fontSize: 16, fontWeight: FontWeight.w600
  static TextStyle bodyTextSB =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  ///fontSize: 20, fontWeight: FontWeight.w500
  static TextStyle titleTextN =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
}
