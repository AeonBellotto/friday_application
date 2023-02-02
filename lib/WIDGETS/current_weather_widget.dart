import 'package:flutter/material.dart';
import 'package:friday_application/UTILITIES/theme.dart';
import '../MODEL/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return TemperatureAreaWidget();
  }

  Widget TemperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          width: 80,
          height: 80,
          color: baseColor,
        ),
        RichText(
            textAlign: TextAlign.end,
            text: TextSpan(children: [
              TextSpan(
                  text: "${weatherDataCurrent.current.temp!.toInt()} °",
                  style: TextStyle(
                      color: baseColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 70)),
            ]))
      ],
    );
  }
}
