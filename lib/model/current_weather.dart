import 'package:weather_app/model/clouds.dart';
import 'package:weather_app/model/coord.dart';
import 'package:weather_app/model/main_weather.dart';
import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/wind.dart';

class CurrentWeather {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  MainWeather? mainWeather;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  DateTime? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  String? icon;

  CurrentWeather(
      {
      this.coord,
      this.weather,
      this.base,
      this.mainWeather,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod,
      this.icon,
      });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    String icon = json['weather'][0]['icon'];

    if(json['weather'][0]['main'] == 'Clouds')
      icon = 'assets/sunny_2d.png';
    else if(json['weather'][0]['main'] == 'Rain')
      icon = 'assets/rainy.png';
    else if(json['weather'][0]['main'] == 'Snow')
      icon = 'assets/snow.png';
    else if(json['weather'][0]['main'] == 'Thunderstorm')
      icon = 'assets/thunder.png';
    else
      icon = 'assets/sunny.png';
    return CurrentWeather(
      coord: Coord.fromJson(json["coord"]),
      weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      base: json["base"],
      mainWeather: MainWeather.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      dt: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
      sys: Sys.fromJson(json["sys"]),
      timezone: json["timezone"],
      id: json["id"],
      name: json["name"],
      cod:json["cod"],
      icon: icon,
    );
  }


}
