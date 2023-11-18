import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.dark;

  void changeLanguage(String newLang) {
    if (appLanguage == newLang) {
      return;
    }
    appLanguage = newLang;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool IsDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  bool IsLightMode() {
    return appTheme == ThemeMode.light;
  }
}
