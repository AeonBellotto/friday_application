import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friday_application/UTILITIES/theme.dart';
import 'package:intl/intl.dart';

class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  DateTime _dateTime = DateTime.now();

  String date = DateFormat("EEEE, d MMM").format(DateTime.now());
  String time = DateFormat("HH:mm").format(DateTime.now());
  String seconds = DateFormat("ss").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        date = DateFormat("EEEE, d MMMM y").format(DateTime.now());
        time = DateFormat("HH:mm").format(DateTime.now());
        seconds = DateFormat("ss").format(DateTime.now());
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
            width: 300,
          ),
          Container(
            width: 260,
            margin: const EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 70,
                      color: baseColor,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  seconds,
                  style: TextStyle(
                    fontSize: 30,
                    color: baseColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 260,
            margin: const EdgeInsets.only(left: 40, top: 5),
            child: Text(
              date,
              style: TextStyle(
                  fontSize: 15,
                  color: baseColor.withOpacity(0.5),
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
