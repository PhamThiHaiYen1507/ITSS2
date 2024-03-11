import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color(0xffFF7E07);
  static const Color greyColor = Color(0xff9D9D9D);
  static const Color background = Color(0xffF4F4F4);

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    primaryColor: primaryColor,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors.white),
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
      onPrimary: primaryColor,
      background: Colors.white,
      onBackground: Colors.white,
    ),
  );
}
