import 'package:dependencies/dependencies.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class Initial extends SettingsState {}

class EnglishLanguageState extends SettingsState {}

class IndonesiaLanguageState extends SettingsState {}
