import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class Initial extends SettingsState {}

class ThemeState extends SettingsState {
  final ThemeData theme;
  final bool isDarkTheme;

  ThemeState({@required this.theme, @required this.isDarkTheme});

  @override
  List<Object> get props => [theme, isDarkTheme];
}
