import 'package:flutter/material.dart';
import 'package:weather_app/src/app_root.dart';
import 'package:weather_app/weatherService/dio_helper.dart';


void main() {

  DioHelper.init();
  runApp(AppRoot());
}
