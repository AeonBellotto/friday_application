import 'package:flutter/material.dart';
import 'package:friday_application/SCREENS/main_screen.dart';
import 'package:friday_application/UTILITIES/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'F.R.I.D.A.Y',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}
