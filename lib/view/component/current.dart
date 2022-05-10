import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../bloc/weather_cubit.dart';
import 'statusRow.dart';
class Current extends StatelessWidget {
  Current({Key? key}) : super(key: key);
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50,left: 30,right: 30),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(CupertinoIcons.square_grid_2x2,color: Colors.white,),
                Row(
                  children: [
                    Icon(CupertinoIcons.location_solid,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(WeatherCubit.get(context).hourlyWeatherList!.time!,style: TextStyle(color: Colors.white,fontSize: 30),),

                  ],
                ),
                Icon(Icons.more_vert,color: Colors.white,),

              ]
          ),

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white,width: 0.2),
                ),
            child: Text('Updating...',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),),
          ),
          Image(image: AssetImage(WeatherCubit.get(context).hourlyWeatherList!.current!.weather![0].icon!),
            width: 300,
            height: 350,
          ),
          Text('${WeatherCubit.get(context).hourlyWeatherList!.current!.temp}°',style: TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ), ),
          Text('${WeatherCubit.get(context).hourlyWeatherList!.current!.weather![0].description}',style: TextStyle(color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w200,
          ), ),
          Text(DateFormat("EEEE dd MMMM").format(dateTime).toString(),style: TextStyle(color: Colors.grey,
          fontSize: 15,


           ),
          ),
          Divider(color: Colors.white,),
          StatusRow(WeatherCubit.get(context).hourlyWeatherList!),
        ],
      ),
    );
  }
}
