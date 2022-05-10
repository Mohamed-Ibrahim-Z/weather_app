import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/homeScreen/component/today_weather.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/weatherService/dio_helper.dart';

import '../bloc/weather_satetes.dart';
import 'component/weather_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      WeatherCubit()
        ..getWeatherData(),
      child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = WeatherCubit.get(context);
            return cubit.weatherData == null ? CircularProgressIndicator(): Scaffold(
              body: Column(
                children: [
                  TodayWeather(),
                  SizedBox(height: 20),
                  WeatherWidget(),
                  FloatingActionButton(onPressed: () {
                    print(cubit.currentWeatherList!.base);
                  }),

                ],
              ),
            );
          }),
    );
  }
}
//Theme.of(context).textTheme.bodyText1
