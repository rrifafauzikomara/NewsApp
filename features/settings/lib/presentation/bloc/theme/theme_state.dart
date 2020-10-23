import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final Brightness brightness;

  ThemeState({@required this.themeData, @required this.brightness});

  @override
  List<Object> get props => [themeData, brightness];
}
