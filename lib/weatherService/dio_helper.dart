import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.openweathermap.org/data/2.5/",
        receiveDataWhenStatusError: false,

      ),
    );
  }


  static Future<Response> getData({
  required String url,
    required Map<String,dynamic> query,
}) async {
    return await dio!.get(url, queryParameters: query);
  }

}