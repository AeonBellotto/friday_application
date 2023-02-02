import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MidSide extends StatefulWidget {
  const MidSide({super.key});

  @override
  State<MidSide> createState() => _MidSideState();
}

class _MidSideState extends State<MidSide> {
  String _consoleLine = "";

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(),
    );
  }
}
