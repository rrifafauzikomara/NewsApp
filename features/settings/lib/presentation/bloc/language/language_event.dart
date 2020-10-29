import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageChanged extends LanguageEvent {
  final bool isIndonesian;

  LanguageChanged({@required this.isIndonesian});

  @override
  List<Object> get props => [isIndonesian];
}

class GetLanguage extends LanguageEvent {}
