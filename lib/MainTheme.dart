import 'package:flutter/material.dart';

class MainTheme {
  static Color LightPrimary = Color(0xffB7935F);
  static Color SlctColor = Colors.black;
  static Color UnSlctColor = Colors.white;

  static ThemeData lightMode = ThemeData(
      primaryColor: LightPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: UnSlctColor,
          selectedItemColor: SlctColor,
          backgroundColor: LightPrimary),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        color: Colors.black,
        backgroundColor: Colors.transparent,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )));
}
