import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/common/styles/color_palettes.dart';

// TODO: buat untuk iOS
final TextTheme _myTextThemeAndroid = TextTheme(
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

ThemeData lightThemeAndroid = ThemeData(
  fontFamily: 'IBMPlexSans',
  backgroundColor: ColorPalettes.lightBG,
  primaryColor: ColorPalettes.lightPrimary,
  accentColor: ColorPalettes.lightAccent,
  cursorColor: ColorPalettes.lightAccent,
  dividerColor: ColorPalettes.darkBG,
  scaffoldBackgroundColor: ColorPalettes.lightBG,
  textTheme: _myTextThemeAndroid,
  appBarTheme: AppBarTheme(
    textTheme: _myTextThemeAndroid.apply(bodyColor: ColorPalettes.lightPrimary),
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: ColorPalettes.lightAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
);

ThemeData darkThemeAndroid = ThemeData(
  fontFamily: 'IBMPlexSans',
  brightness: Brightness.dark,
  backgroundColor: ColorPalettes.darkBG,
  primaryColor: ColorPalettes.darkPrimary,
  accentColor: ColorPalettes.darkAccent,
  dividerColor: ColorPalettes.lightPrimary,
  scaffoldBackgroundColor: ColorPalettes.darkBG,
  cursorColor: ColorPalettes.darkAccent,
  textTheme: _myTextThemeAndroid,
  appBarTheme: AppBarTheme(
    textTheme: _myTextThemeAndroid.apply(bodyColor: ColorPalettes.darkPrimary),
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: ColorPalettes.darkAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
);
