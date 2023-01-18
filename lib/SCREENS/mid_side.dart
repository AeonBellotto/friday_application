import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dart_console/dart_console.dart';

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
    setState(() {
      //_consoleLine = sshCom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(
          _consoleLine,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

String sshCom() {
  final console = Console();
  String line = "";

  console.clearScreen();
  console.resetCursorPosition();

  line = console.readLine()!;

  return line;
}
