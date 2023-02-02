import 'package:flutter/foundation.dart';
import 'package:friday_application/CONTROLLER/global_controller.dart';
import 'package:friday_application/UTILITIES/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../UTILITIES/server.dart';

class ServerController extends GetxController {
  Server? server;
  List<String> serverLogs = [];
  TextEditingController messageController = TextEditingController();

  Future<void> startOrStopServer() async {
    if (server!.running) {
      await server!.stop();
      serverLogs.clear();
    } else {
      await server!.start();
    }
    update();
  }

  @override
  void onInit() {
    server = Server(onData, onError);
    startOrStopServer();
    super.onInit();
  }

  void onData(Uint8List data) {
    final receviedData = String.fromCharCodes(data);
    serverLogs.add(receviedData);
    print(receviedData);
    if (receviedData.startsWith("a")) {
      globalLat = double.parse(receviedData.substring(1));
    } else if (receviedData.startsWith("o")) {
      globalLng = double.parse(receviedData.substring(1));
    } else if (receviedData.startsWith("rgb")) {
      String temp = receviedData.substring(3);
      baseRed = int.parse(temp.split(",")[0]);
      print(baseRed);
      baseGreen = int.parse(temp.split(",")[1]);
      print(baseGreen);
      baseBlue = int.parse(temp.split(",")[2]);
      print(baseBlue);
    }
    update();
  }

  void onError(dynamic error) {
    debugPrint("Error: $error");
  }

  void handleMessage() {
    server!.broadcast(messageController.text);
    //serverLogs.add(messageController.text);
    messageController.clear();
    update();
  }
}
