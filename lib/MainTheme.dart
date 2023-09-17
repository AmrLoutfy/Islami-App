import 'package:flutter/material.dart';

class MainTheme {
  static Color LightPrimary = Color(0xffB7935F);
  static Color SlctColor = Colors.black;
  static Color UnSlctColor = Colors.white;
  static Color DarkPrimary = Color(0xff141A2E);
  static Color YellowColor = Color(0xffFACC1D);

  static ThemeData lightMode = ThemeData(
      primaryColor: LightPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent),
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
          ),
          titleMedium: TextStyle(
          color: Colors.black,
          backgroundColor: Colors.transparent,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          backgroundColor: Colors.transparent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ));

  static ThemeData darkMode = ThemeData(
      primaryColor: DarkPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.white,
          selectedItemColor: YellowColor,
          backgroundColor: DarkPrimary),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.transparent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.transparent,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            color: YellowColor,
            backgroundColor: Colors.transparent,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )));
}
