import "package:flutter/material.dart";
import 'package:friday_application/UTILITIES/theme.dart';
import 'package:intl/intl.dart';
import '../MODEL/weather_data_daily.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyDataForecast({super.key, required this.weatherDataDaily});

  // String manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return dailyList();
  }

  Widget dailyList() {
    return Container(
      //color: Colors.amber,
      height: 300,
      width: 260,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 90,
                        child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                          style: TextStyle(
                              color: baseColor.withOpacity(0.5), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 24,
                        child: Image.asset(
                            "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png",
                            color: baseColor),
                      ),
                      Text(
                        "${weatherDataDaily.daily[index].temp!.min}°",
                        style: TextStyle(
                            fontSize: 18, color: baseColor.withOpacity(0.5)),
                      ),
                      Text(
                        "${weatherDataDaily.daily[index].temp!.max}°",
                        style: TextStyle(fontSize: 18, color: baseColor),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
