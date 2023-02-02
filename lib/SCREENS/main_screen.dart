import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:friday_application/CONTROLLER/comm_controller.dart';
import 'package:friday_application/CONTROLLER/global_controller.dart';
import 'package:friday_application/SCREENS/left_side.dart';
import 'package:friday_application/SCREENS/mid_side.dart';
import 'package:friday_application/SCREENS/right_side.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../UTILITIES/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: GetBuilder<ServerController>(
        init: ServerController(),
        builder: ((controller) {
          return Row(
            children: [
              const LeftSide(),
              const MidSide(),
              const RightSide(),
            ],
          );
        }),
      ),
    );
  }
}
