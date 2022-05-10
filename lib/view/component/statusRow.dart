import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/hourly_weather/hourly_weather.dart';

import '../../bloc/weather_cubit.dart';
import '../../model/current_weather.dart';
class StatusRow extends StatelessWidget {
  HourlyWeather? currentWeather;
  StatusRow(this.currentWeather,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(CupertinoIcons.wind,color: Colors.white,),
            Text('${currentWeather!.current!.windSpeed}' + ' m/s',style: TextStyle(color: Colors.white,fontSize: 10),),
            Text('Wind'  ,style: TextStyle(color: Colors.grey,fontSize: 10),),
          ],
        ),
        Column(
          children: [
            Icon( CupertinoIcons.drop, color: Colors.white,),
            Text('${currentWeather!.current!.humidity}' + '%',style: TextStyle(color: Colors.white,fontSize: 10),),
            Text('Humidity' ,style: TextStyle(color: Colors.grey,fontSize: 10),),
          ],
        ),
        Column(
          children: [
            Icon(  CupertinoIcons.cloud_rain, color: Colors.white,),
            Text('${currentWeather!.current!.uvi}' ,style: TextStyle(color: Colors.white,fontSize: 10),),
            Text('Rain Chance',style: TextStyle(color: Colors.grey,fontSize: 10),),
          ],
        ),
      ],
    );
  }
}
