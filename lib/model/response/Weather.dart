class Weather {
    String? description;
    String? icon;
    int? id;
    String? main;

    Weather({this.description, this.icon, this.id, this.main});

    factory Weather.fromJson(Map<String, dynamic> json) {
        return Weather(
            description: json['description'], 
            icon: json['icon'], 
            id: json['id'], 
            main: json['main'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['description'] = description;
        data['icon'] = icon;
        data['id'] = id;
        data['main'] = main;
        return data;
    }
}