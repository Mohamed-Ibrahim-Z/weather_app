import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/weather.dart';
class  WeatherWidget extends StatelessWidget {
  final CurrentWeather? weather;
  const  WeatherWidget({this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 0.2, color: Colors.white),
        borderRadius: BorderRadius.circular(15),

      ),
      child : Text('cubit'),
    );
  }
}
