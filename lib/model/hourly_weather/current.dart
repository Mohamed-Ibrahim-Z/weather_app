import 'package:weather_app/model/weather.dart';

class Current{
  DateTime? dt;
  int? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  int? uvi;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.uvi,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json){
    print("Here");
    return Current(
      dt: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
      temp: (json["temp"] - 273.15).toInt(),
      feelsLike: json['feels_like']?.toDouble(),
      pressure: json['pressure']?.toInt(),
      humidity: json['humidity']?.toInt(),
      uvi: json['uvi']?.toInt(),
      windSpeed: json['wind_speed']?.toDouble(),
      weather: List<Weather>.from(
          json["weather"].map((x) => Weather.fromJson(x))),
    );
  }
}