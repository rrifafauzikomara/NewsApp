import 'package:dependencies/dependencies.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent([this.isDarkTheme = false, this.isEnglish = true]);

  final bool isDarkTheme;
  final bool isEnglish;

  @override
  List<Object> get props => [];
}

class ChangeTheme extends SettingsEvent {
  ChangeTheme(bool isDarkTheme) : super(isDarkTheme);
}

class ChangeLanguage extends SettingsEvent {
  ChangeLanguage(bool isEnglish) : super(isEnglish);
}
