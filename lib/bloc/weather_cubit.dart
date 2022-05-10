import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_satetes.dart';
import 'package:weather_app/model/current_weather.dart';

import '../weatherService/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get (context)=> BlocProvider.of(context);


  Map<String,dynamic>? weatherData;

  CurrentWeather? currentWeatherList ;
  void getWeatherData() {
    emit(WeatherLoadingState());
    DioHelper.getData(url: '/weather', query: {
      'q': 'cairo',
      'appid': '19d29003828f1560f16379aa4b36bd32'
    }).then((value) {
      weatherData = value.data;
      print(weatherData.toString());

      currentWeatherList = CurrentWeather.fromJson(weatherData!);
      emit(GetWeatherSuccessState());
    }).catchError((onError){
      emit(GetWeatherFailureState(errorMessage: onError.toString()));
      print(onError.toString());
    });

  }
}