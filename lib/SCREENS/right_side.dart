import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friday_application/WIDGETS/current_weather_widget.dart';
import 'package:friday_application/WIDGETS/daily_data_forecast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../CONTROLLER/global_controller.dart';
import '../WIDGETS/location_widget.dart';

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  DateTime _dateTime = DateTime.now();
  // call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_dateTime.second != DateTime.now().second) {
        setState(() {
          if (globalController.checkLoading().isTrue) {
            globalController.getLocationGPS();
          }
          _dateTime = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        (() => globalController.checkLoading().isTrue
            ? const SizedBox(
                width: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                    width: 300,
                  ),
                  SizedBox(
                    width: 300,
                    child: CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather()),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const LocationWidget(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DailyDataForecast(
                      weatherDataDaily:
                          globalController.getData().getDailyWeather())
                ],
              )),
      ),
    );
  }
}
