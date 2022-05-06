class FiveDays{
  String? dateTime;
  int? temp;

  FiveDays({this.dateTime, this.temp});

  factory FiveDays.fromJson(Map<String, dynamic> json) {
    return FiveDays(
      dateTime: json["dateTime"],
      temp: int.parse(json["temp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dateTime": this.dateTime,
      "temp": this.temp,
    };
  }

//

}