import 'current.dart';

class HourlyWeather {
  double? lat;
  double? lon;
  String? time;
  Current? current;
  List<Current>? hourly;

  HourlyWeather({
    this.lat,
    this.lon,
    this.time,
    this.current,
    this.hourly,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(

    lat: json["lat"],
    lon: json["lon"],
    time: json["timezone"],
    current: Current.fromJson(json["current"]),
    hourly: List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
  );
  }

}