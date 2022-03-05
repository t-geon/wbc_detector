import 'package:flutter/material.dart';
import 'package:wbc_detector/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: PrimaryColor,
      elevation: 0.0,
    ),
    primaryColor: PrimaryColor,
    textSelectionTheme: TextSelectionThemeData(cursorColor: PrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        fontFamily: 'nanumGothic', fontSize: 18.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        fontFamily: 'nanumGothic', fontSize: 16.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(
        fontFamily: 'nanumGothic', fontSize: 16.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontFamily: 'nanumGothic', fontSize: 15.0),
    bodyText2: TextStyle(fontFamily: 'nanumGothic', fontSize: 14.0),
  );
}
