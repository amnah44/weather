class Coord {
    int? lat;
    int? lon;

    Coord({this.lat, this.lon});

    factory Coord.fromJson(Map<String, dynamic> json) {
        return Coord(
            lat: json['lat'], 
            lon: json['lon'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['lat'] = lat;
        data['lon'] = lon;
        return data;
    }
}