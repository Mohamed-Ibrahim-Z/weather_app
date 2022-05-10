import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/hourly_weather/current.dart';
import 'package:weather_app/model/hourly_weather/hourly_weather.dart';
import 'package:weather_app/model/weather.dart';
class  WeatherWidget extends StatelessWidget {
  final Current? weather;
  const  WeatherWidget({this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 0.2, color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child : Column(
        children: [
          Text(
            (this.weather!.temp).toString() + "°",
            style: TextStyle(fontSize: 20,)
          ),
          Image(image: AssetImage(weather!.weather![0].icon!),
            width: 50,
            height: 50,
          ),
          Text(
              (this.weather!.dt!.hour).toString() + ":" + "00",
              style: TextStyle(fontSize: 15,
              color: Colors.grey,
              )
          ),
        ],
      ),
    );
  }
}
