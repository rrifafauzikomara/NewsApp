import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SharedPrefHelper {
  static const _isDarkTheme = "isDarkTheme";
  final SharedPreferences preferences;

  SharedPrefHelper({@required this.preferences});

  Future<bool> getValueDarkTheme() async {
    return preferences.getBool(_isDarkTheme) ?? false;
  }

  Future saveValueDarkTheme(bool value) async {
    preferences.setBool(_isDarkTheme, value);
  }
}
