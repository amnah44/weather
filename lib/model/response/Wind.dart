class Wind {
    int? deg;
    double? gust;
    double? speed;

    Wind({this.deg, this.gust, this.speed});

    factory Wind.fromJson(Map<String, dynamic> json) {
        return Wind(
            deg: json['deg'], 
            gust: json['gust'], 
            speed: json['speed'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['deg'] = deg;
        data['gust'] = gust;
        data['speed'] = speed;
        return data;
    }
}