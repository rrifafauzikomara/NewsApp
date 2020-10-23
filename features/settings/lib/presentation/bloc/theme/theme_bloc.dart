import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:settings/presentation/bloc/theme/bloc.dart';
import 'package:shared/common/common.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: lightTheme, brightness: Brightness.light));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      if (event.isDarkTheme) {
        yield ThemeState(themeData: darkTheme, brightness: Brightness.dark);
      } else {
        yield ThemeState(themeData: lightTheme, brightness: Brightness.light);
      }
    }
  }
}
