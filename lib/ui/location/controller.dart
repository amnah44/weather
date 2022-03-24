import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/model/response/weather_response.dart';
import 'package:weatherflutter/network/weather_repository.dart';
import 'package:weatherflutter/network/weather_service.dart';

import '../../network/dio_connectivity.dart';
import '../../network/intercepter.dart';

class LocationController extends GetxController {
  String? city;
  String? weatherIcon;
  String? weatherMessage;
  bool isLoading = false;
  WeatherResponse weatherResponse = WeatherResponse();
  var weather = WeatherService(city: 'baghdad');
  LocationController({required this.city});

  // WeatherModel weather = WeatherModel();
  // final locationData = LocationData().obs;

  @override
  void onInit() {
    getCurrentWeatherData();
    super.onInit();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeather(
        onLoading: () => loading(),
        onSuccess: (data) {
          isLoading = false;
          _getData(data);
          weatherResponse = data;
          update();
        },
        onError: (error) {
          print(error);
          update();
        });
  }
  void _getData(data){
    int? condition = data.weather?[0].id;
    int? temperture = data.main?.temp?.toInt();
    weatherIcon = weather.getWeatherIcon(condition!);
    weatherMessage = weather.getMessage(temperture!);
  }

  void loading() {
    isLoading = true;
    update();
  }
}
