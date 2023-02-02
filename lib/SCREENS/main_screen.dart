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
          //readingComm(controller);
          return Row(
            children: [
              const LeftSide(),
              Expanded(
                  child: ListView(
                children: controller.serverLogs.map((e) => Text("$e")).toList(),
              )),
              Text(controller.serverLogs.length.toString()),
              //Text(controller.serverLogs.last),
              ElevatedButton(
                  onPressed: () {
                    readingComm(controller);
                    setState(() {});
                  },
                  child: Text("Clear")),
              const RightSide()
            ],
          );
        }),
      ),
    );
  }

  Future<void> readingComm(ServerController controller) async {
    if (controller.serverLogs.isNotEmpty) {
      if (controller.serverLogs.last.startsWith("b")) {
        baseBlue = int.parse(controller.serverLogs.last.substring(1));
        print(baseBlue);
        controller.serverLogs.removeLast();
      } else if (controller.serverLogs.last.startsWith("g")) {
        baseGreen = int.parse(controller.serverLogs.last.substring(1));
        print(baseGreen);
        controller.serverLogs.removeLast();
      } else if (controller.serverLogs.last.startsWith("r")) {
        baseRed = int.parse(controller.serverLogs.last.substring(1));
        print(baseRed);
        controller.serverLogs.removeLast();
      } else if (controller.serverLogs.last.startsWith("a")) {
        globalLat = double.parse(controller.serverLogs.last.substring(1));
        print(globalLat);
        controller.serverLogs.removeLast();
      } else if (controller.serverLogs.last.startsWith("o")) {
        globalLng = double.parse(controller.serverLogs.last.substring(1));
        print(globalLng);
        controller.serverLogs.removeLast();
      } else {
        controller.serverLogs.clear();
      }
    }
  }
}
