import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class Initial extends SettingsState {}

class EnglishLanguageState extends SettingsState {}

class IndonesiaLanguageState extends SettingsState {}

class LanguageState extends SettingsState {
  final bool isActive;

  LanguageState({@required this.isActive});

  @override
  List<Object> get props => [isActive];
}
