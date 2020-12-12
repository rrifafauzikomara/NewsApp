import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPrefHelper {
  static const _isDarkTheme = "isDarkTheme";
  static const _isIndonesian = "isIndonesian";
  final SharedPreferences preferences;

  SharedPrefHelper({@required this.preferences});

  Future<bool> getValueDarkTheme() async {
    return preferences.getBool(_isDarkTheme) ?? false;
  }

  Future saveValueDarkTheme(bool value) async {
    preferences.setBool(_isDarkTheme, value);
  }

  Future<bool> getValueIndonesianLanguage() async {
    return preferences.getBool(_isIndonesian) ?? false;
  }

  Future saveValueIndonesianLanguage(bool value) async {
    preferences.setBool(_isIndonesian, value);
  }
}
