class Weather{
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});
  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json);
    String icon = 'icon';

    if(json['main'] == 'Clouds')
      icon = 'assets/sunny_2d.png';
    else if(json['main'] == 'Rain')
      icon = 'assets/rainy.png';
    else if(json['main'] == 'Snow')
      icon = 'assets/snow.png';
    else if(json['main'] == 'Thunderstorm')
      icon = 'assets/thunder.png';
    else
      icon = 'assets/sunny.png';
    return Weather(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: icon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "main": this.main,
      "description": this.description,
      "icon": this.icon,
    };
  }

//

}