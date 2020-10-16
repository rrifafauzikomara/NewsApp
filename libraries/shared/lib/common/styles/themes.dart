import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/common/styles/color_palettes.dart';

// Styling for text
final TextTheme _myTextTheme = TextTheme(
  headline1:
      TextStyle(fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2:
      TextStyle(fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: TextStyle(fontSize: 46, fontWeight: FontWeight.w400),
  headline4:
      TextStyle(fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
  headline6:
      TextStyle(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1:
      TextStyle(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2:
      TextStyle(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2:
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button:
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption:
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline:
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

// Styling for light theme
ThemeData lightTheme = ThemeData(
  fontFamily: 'IBMPlexSans',
  backgroundColor: Modular.get<ColorPalettes>().lightBG,
  primaryColor: Modular.get<ColorPalettes>().lightPrimary,
  accentColor: Modular.get<ColorPalettes>().lightAccent,
  cursorColor: Modular.get<ColorPalettes>().lightAccent,
  dividerColor: Modular.get<ColorPalettes>().darkBG,
  scaffoldBackgroundColor: Modular.get<ColorPalettes>().lightBG,
  textTheme: _myTextTheme,
  appBarTheme: AppBarTheme(
    textTheme:
        _myTextTheme.apply(bodyColor: Modular.get<ColorPalettes>().darkPrimary),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Modular.get<ColorPalettes>().lightAccent,
    unselectedItemColor: Colors.grey,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Modular.get<ColorPalettes>().lightAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
);

// Styling for dark theme
ThemeData darkTheme = ThemeData(
  fontFamily: 'IBMPlexSans',
  brightness: Brightness.dark,
  backgroundColor: Modular.get<ColorPalettes>().darkBG,
  primaryColor: Modular.get<ColorPalettes>().darkPrimary,
  accentColor: Modular.get<ColorPalettes>().darkAccent,
  dividerColor: Modular.get<ColorPalettes>().lightPrimary,
  scaffoldBackgroundColor: Modular.get<ColorPalettes>().darkBG,
  cursorColor: Modular.get<ColorPalettes>().darkAccent,
  textTheme: _myTextTheme,
  appBarTheme: AppBarTheme(
    textTheme: _myTextTheme.apply(
        bodyColor: Modular.get<ColorPalettes>().lightPrimary),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Modular.get<ColorPalettes>().darkAccent,
    unselectedItemColor: Colors.grey,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Modular.get<ColorPalettes>().darkAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
);
