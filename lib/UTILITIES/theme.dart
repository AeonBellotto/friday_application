import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Roboto',
    textTheme: textTheme(),
  );
}

int baseAlpha = 255;
int baseRed = 255;
int baseGreen = 255;
int baseBlue = 255;

Color baseColor = Color.fromARGB(baseAlpha, baseRed, baseGreen, baseBlue);

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(color: baseColor, fontSize: 60),
    headline2: TextStyle(color: baseColor, fontSize: 40),
    headline3: TextStyle(color: baseColor.withOpacity(0.7), fontSize: 20),
    headline4: TextStyle(color: baseColor, fontSize: 16),
    headline5: TextStyle(color: baseColor, fontSize: 14),
    headline6: TextStyle(color: baseColor, fontSize: 12),
    bodyText1: TextStyle(color: baseColor, fontSize: 12),
    bodyText2: TextStyle(
        color: baseColor, fontSize: 10, fontWeight: FontWeight.normal),
  );
}
