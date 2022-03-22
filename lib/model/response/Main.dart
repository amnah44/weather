class Main {
    double? feels_like;
    int? grnd_level;
    int? humidity;
    int? pressure;
    int? sea_level;
    double? temp;
    double? temp_max;
    double? temp_min;

    Main({this.feels_like, this.grnd_level, this.humidity, this.pressure, this.sea_level, this.temp, this.temp_max, this.temp_min});

    factory Main.fromJson(Map<String, dynamic> json) {
        return Main(
            feels_like: json['feels_like'], 
            grnd_level: json['grnd_level'], 
            humidity: json['humidity'], 
            pressure: json['pressure'], 
            sea_level: json['sea_level'], 
            temp: json['temp'], 
            temp_max: json['temp_max'], 
            temp_min: json['temp_min'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['feels_like'] = feels_like;
        data['grnd_level'] = grnd_level;
        data['humidity'] = humidity;
        data['pressure'] = pressure;
        data['sea_level'] = sea_level;
        data['temp'] = temp;
        data['temp_max'] = temp_max;
        data['temp_min'] = temp_min;
        return data;
    }
}