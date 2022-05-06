class Sys{
  double? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: double.parse(json["type"]),
      id: int.parse(json["id"]),
      country: json["country"],
      sunrise: int.parse(json["sunrise"]),
      sunset: int.parse(json["sunset"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": this.type,
      "id": this.id,
      "country": this.country,
      "sunrise": this.sunrise,
      "sunset": this.sunset,
    };
  }
}