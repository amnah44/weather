class Sys {
    String country;
    int sunrise;
    int sunset;

    Sys({this.country, this.sunrise, this.sunset});

    factory Sys.fromJson(Map<String, dynamic> json) {
        return Sys(
            country: json['country'], 
            sunrise: json['sunrise'], 
            sunset: json['sunset'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country'] = this.country;
        data['sunrise'] = this.sunrise;
        data['sunset'] = this.sunset;
        return data;
    }
}