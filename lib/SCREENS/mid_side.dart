import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friday_application/UTILITIES/theme.dart';

class MidSide extends StatefulWidget {
  const MidSide({super.key});

  @override
  State<MidSide> createState() => _MidSideState();
}

class _MidSideState extends State<MidSide> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        baseColor = Color.fromARGB(baseAlpha, baseRed, baseGreen, baseBlue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(),
    );
  }
}
