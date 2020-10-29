import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class InitialLanguage extends LanguageState {
  final bool isIndonesian;

  InitialLanguage({@required this.isIndonesian});

  @override
  List<Object> get props => [isIndonesian];
}

class EnglishLanguageState extends LanguageState {}

class IndonesiaLanguageState extends LanguageState {}
