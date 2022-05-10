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
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

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
      this.cod
      });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      coord: Coord.fromJson(json["coord"]),
      weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      base: json["base"],
      mainWeather: MainWeather.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      dt: json["dt"],
      sys: Sys.fromJson(json["sys"]),
      timezone: json["timezone"],
      id: json["id"],
      name: json["name"],
      cod:json["cod"],
    );
  }


}
