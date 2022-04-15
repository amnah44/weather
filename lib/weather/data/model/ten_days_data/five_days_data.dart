import 'package:json_annotation/json_annotation.dart';

part 'five_days_data.g.dart';

@JsonSerializable()
class TenDayData {
  final String? dateTime;
  final int? temp;

  TenDayData({this.dateTime, this.temp});

  factory TenDayData.fromJson(Map<String,dynamic> json) =>
      _$TenDayDataFromJson(json);

  Map<String, dynamic> toJson() => _$TenDayDataToJson(this);
}
