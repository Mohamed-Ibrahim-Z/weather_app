import 'package:flutter/material.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/view/component/currnt2.dart';

import '../../model/hourly_weather/hourly_weather.dart';
import '../component/statusRow.dart';

class TomorrowWeatherView extends StatelessWidget {
  HourlyWeather? weather;

  TomorrowWeatherView(this.weather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(body: Column(
        children: [
          Currnt2(weather),
          SevenDays(),
        ],

      )),
    );
  }
}

class SevenDays extends StatelessWidget {
  List sevenDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(sevenDays[index],
                  style: TextStyle(
                    fontSize: 20,),),
              ],
            ),

          );
        },
      ),
    );
  }
}
