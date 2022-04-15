import 'package:json_annotation/json_annotation.dart';

part 'five_days_data.g.dart';

@JsonSerializable()
class FiveDayData {
  final String? dateTime;
  final int? temp;

  FiveDayData({this.dateTime, this.temp});

  factory FiveDayData.fromJson(Map<String,dynamic> json) =>
      _$FiveDayDataFromJson(json);

  Map<String, dynamic> toJson() => _$FiveDayDataToJson(this);
}
