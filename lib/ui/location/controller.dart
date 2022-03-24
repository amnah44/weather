import 'package:get/get.dart';
import 'package:weatherflutter/model/response/weather_response.dart';
import 'package:weatherflutter/network/weather_service.dart';


class Controller extends GetxController {
  String? city;
  String? weatherIcon;
  String? weatherMessage;
  WeatherResponse weatherResponse = WeatherResponse();
  var weather = WeatherService(city: 'baghdad');

  Controller({required this.city});

  @override
  void onInit() {
    getCurrentWeatherData();
    super.onInit();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeather(
        onSuccess: (data) {
          getData(data);
          weatherResponse = data;
          update();
        },
        onError: (error) {
          print(error);
          update();
        });
  }
  void getWeatherDataByCityName(typeName) {
    WeatherService(city: '$city').getWeatherByCityName(
        onSuccess: (data) {
          getData(data);
          weatherResponse = data;
          update();
        },
        onError: (error) {
          print(error);
          update();
        });
  }
  void getData(data){
    int? condition = data.weather?[0].id;
    int? temperture = data.main?.temp?.toInt();
    weatherIcon = weather.getWeatherIcon(condition!);
    weatherMessage = weather.getMessage(temperture!);
  }
}
