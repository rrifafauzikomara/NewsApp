import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends SettingsEvent {
  final bool isEnglish;

  ChangeLanguage({@required this.isEnglish});

  @override
  List<Object> get props => [isEnglish];
}
