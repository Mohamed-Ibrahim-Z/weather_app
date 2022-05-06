import 'package:weather_app/model/clouds.dart';
import 'package:weather_app/model/coord.dart';
import 'package:weather_app/model/main_weather.dart';
import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weather.dart';

class CurrentWeather {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  MainWeather? mainWeather;
  int? visibility;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeather(
      {this.coord,
      this.weather,
      this.base,
      this.mainWeather,
      this.visibility,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      coord: Coord.fromJson(json["coord"]),
      weather: List.of(json["weather"]).map((i) => i ).toList() != null
          ? List.of(json["weather"]).map((i) => Weather.fromJson(i)).toList()
          : null,
      base: json["base"],
      mainWeather: MainWeather.fromJson(json["mainWeather"]),
      visibility: int.parse(json["visibility"]),
      clouds: Clouds.fromJson(json["clouds"]),
      dt: int.parse(json["dt"]),
      sys: Sys.fromJson(json["sys"]),
      timezone: int.parse(json["timezone"]),
      id: int.parse(json["id"]),
      name: json["name"],
      cod: int.parse(json["cod"]),
    );
  }
//

}
