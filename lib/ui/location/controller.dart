import 'package:get/get.dart';
import 'package:weatherflutter/model/response/weather_response.dart';
import 'package:weatherflutter/network/weather_service.dart';


class LocationController extends GetxController {
  String? city;
  String? weatherIcon;
  String? weatherMessage;
  bool isLoading = false;
  WeatherResponse weatherResponse = WeatherResponse();
  var weather = WeatherService(city: 'baghdad');
  LocationController({required this.city});

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
