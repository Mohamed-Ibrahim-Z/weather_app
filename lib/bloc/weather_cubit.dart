import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_satetes.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/hourly_weather/hourly_weather.dart';

import '../weatherService/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get (context)=> BlocProvider.of(context);


  Map<String,dynamic>? weatherData;
  CurrentWeather? currentWeatherList ;

  Map<String,dynamic>? hourlyWeatherData;
  HourlyWeather? hourlyWeatherList ;

  Map<String,dynamic>? DailyWeatherData;
  HourlyWeather? DailyWeatherList ;
  // void getWeatherCurrentData() {
  //   emit(WeatherLoadingState());
  //   DioHelper.getData(url: '/weather', query: {
  //     'q': 'cairo',
  //     'appid': '19d29003828f1560f16379aa4b36bd32'
  //   }).then((value) {
  //     weatherData = value.data;
  //     print(weatherData.toString());
  //
  //     currentWeatherList = CurrentWeather.fromJson(weatherData!);
  //     emit(GetWeatherSuccessState());
  //   }).catchError((onError){
  //     emit(GetWeatherFailureState(errorMessage: onError.toString()));
  //     print(onError.toString());
  //   });
  //
  // }

  void getHourlyWeatherData() {
    emit(WeatherLoadingState());
    DioHelper.getData(url: '/onecall', query: {
      'lat': '30.0444',
      'lon': '31.2357',
      'exclude': 'minutely,daily,alerts',
      'appid': '19d29003828f1560f16379aa4b36bd32',
    }).then((value) {
      hourlyWeatherData = value.data;
      hourlyWeatherList = HourlyWeather.fromJson(hourlyWeatherData!);
      emit(GetWeatherSuccessState());
    }).catchError((onError) {
      emit(GetWeatherFailureState(errorMessage: onError.toString()));
      print(onError.toString());
    });
  }
    void getDailyWeatherData() {
      emit(WeatherLoadingState());
      DioHelper.getData(url: '/onecall', query: {
        'lat': '30.0444',
        'lon': '31.2357',
        'exclude': 'daily,alerts,hourly',
        'appid': '19d29003828f1560f16379aa4b36bd32',
      }).then((value) {
        DailyWeatherData = value.data;
        DailyWeatherList = HourlyWeather.fromJson(DailyWeatherData!);
        emit(GetWeatherSuccessState());
      }).catchError((onError) {
        emit(GetWeatherFailureState(errorMessage: onError.toString()));
        print(onError.toString());
      });
    }
}