import 'Clouds.dart';
import 'Coord.dart';
import 'Main.dart';
import 'Sys.dart';
import 'Weather.dart';
import 'Wind.dart';

class WeatherResponse {
    String? base;
    Clouds? clouds;
    int? cod;
    Coord? coord;
    int? dt;
    int? id;
    Main? main;
    String? name;
    Sys? sys;
    int? timezone;
    int? visibility;
    List<Weather>? weather;
    Wind? wind;

    WeatherResponse({this.base, this.clouds, this.cod, this.coord, this.dt, this.id, this.main, this.name, this.sys, this.timezone, this.visibility, this.weather, this.wind});

    factory WeatherResponse.fromJson(Map<String, dynamic> json) {
        return WeatherResponse(
            base: json['base'], 
            clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null, 
            cod: json['cod'], 
            coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null, 
            dt: json['dt'], 
            id: json['id'], 
            main: json['main'] != null ? Main.fromJson(json['main']) : null, 
            name: json['name'], 
            sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null, 
            timezone: json['timezone'], 
            visibility: json['visibility'], 
            weather: json['weather'] != null ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList() : null, 
            wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['base'] = base;
        data['cod'] = cod;
        data['dt'] = dt;
        data['id'] = id;
        data['name'] = name;
        data['timezone'] = timezone;
        data['visibility'] = visibility;
        if (clouds != null) {
            data['clouds'] = clouds?.toJson();
        }
        if (coord != null) {
            data['coord'] = coord?.toJson();
        }
        if (main != null) {
            data['main'] = main?.toJson();
        }
        if (sys != null) {
            data['sys'] = sys?.toJson();
        }
        if (weather != null) {
            data['weather'] = weather?.map((v) => v.toJson()).toList();
        }
        if (wind != null) {
            data['wind'] = wind?.toJson();
        }
        return data;
    }
}