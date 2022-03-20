import 'dart:convert';

import 'package:dio/dio.dart';


class WeatherRepository{
  WeatherRepository(this.uri);
  final uri;

  Future getData() async {
    final response = await Dio().get('$uri');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.toString());
      return  data;
    } else {
      print(response.statusCode);
    }
  }
}