import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/view/tomorrowWeather/tomorrow_weather_view.dart';
import 'package:weather_app/weatherService/dio_helper.dart';

import '../bloc/weather_satetes.dart';
import 'component/current.dart';
import 'component/today_weather.dart';
import 'component/weather_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()..getHourlyWeatherData(),
      child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = WeatherCubit.get(context);
            return cubit.hourlyWeatherData == null
                ? Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  )
                : Scaffold(
                    body: Column(
                      children: [
                        Expanded(child: Current()),
                        InkWell(
                            child: TodayWeather(),
                            onTap: () {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TomorrowWeatherView(
                                          cubit.hourlyWeatherList)));
                            }),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherWidget(
                                weather: cubit.hourlyWeatherList!.current,
                              ),
                              WeatherWidget(
                                weather: cubit.hourlyWeatherList!.hourly![1],
                              ),
                              WeatherWidget(
                                weather: cubit.hourlyWeatherList!.hourly![2],
                              ),
                              WeatherWidget(
                                weather: cubit.hourlyWeatherList!.hourly![3],
                              ),
                            ])
                      ],
                    ),
                  );
          }),
    );
  }
}

//Theme.of(context).textTheme.bodyText1
