import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends SettingsEvent {
  final bool isDarkTheme;

  ChangeTheme({@required this.isDarkTheme});

  @override
  List<Object> get props => [isDarkTheme];
}

class ChangeLanguage extends SettingsEvent {
  final bool isEnglish;

  ChangeLanguage({@required this.isEnglish});

  @override
  List<Object> get props => [isEnglish];
}
