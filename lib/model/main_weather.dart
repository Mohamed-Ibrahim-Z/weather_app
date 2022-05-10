class MainWeather{
  double?  feels_like;
  int? pressure, humidity,temp,temp_min, temp_max;

  MainWeather({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: (json["temp"] - 273.15).toInt(),
      feels_like: json["feels_like"],
      temp_min: (json["temp_min"] - 273.15).toInt(),
      temp_max: (json["temp_max"] - 273.15).toInt(),
      pressure: json["pressure"],
      humidity: json["humidity"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "feels_like": this.feels_like,
      "temp_min": this.temp_min,
      "temp_max": this.temp_max,
      "pressure": this.pressure,
      "humidity": this.humidity,
    };
  }

//

}