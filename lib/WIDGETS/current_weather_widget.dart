import 'package:flutter/material.dart';
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
        ),
        RichText(
            textAlign: TextAlign.end,
            text: TextSpan(children: [
              TextSpan(
                  text: "${weatherDataCurrent.current.temp!.toInt()} °",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 70)),
            ]))
      ],
    );
  }
}
