import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Roboto',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(color: Colors.white, fontSize: 60),
    headline2: TextStyle(color: Colors.white, fontSize: 40),
    headline3: TextStyle(color: Colors.grey, fontSize: 20),
    headline4: TextStyle(color: Colors.white, fontSize: 16),
    headline5: TextStyle(color: Colors.white, fontSize: 14),
    headline6: TextStyle(color: Colors.white, fontSize: 12),
    bodyText1: TextStyle(color: Colors.white, fontSize: 12),
    bodyText2: TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.normal),
  );
}
