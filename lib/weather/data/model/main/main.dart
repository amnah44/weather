import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
    final double? temp;
    final double? feelsLike;
    final double? tempMin;
    final double? tempMax;
    final int? pressure;
    final int? humidity;

    Main(
        {this.temp,
            this.feelsLike,
            this.tempMin,
            this.tempMax,
            this.pressure,
            this.humidity});

    factory Main.fromJson(Map<String,dynamic> json) =>
        _$MainFromJson(json);

    Map<String, dynamic> toJson() => _$MainToJson(this);
}
