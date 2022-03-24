class Wind {
    int? deg;
    double? speed;

    Wind({this.deg, this.speed});

    factory Wind.fromJson(dynamic json) {
        if(json == null){
            return Wind();
        }
        return Wind(
            deg: json['deg'],
            speed: json['speed'], 
        );
    }
}