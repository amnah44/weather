import 'package:get/get.dart';

import '../../network/weather_model.dart';

class LocationController extends GetxController {
  WeatherModel weather = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;
  bool isLoading = false;

  @override
  void onInit() {
    initState();
    update();
    super.onInit();
  }

  void initState() {
    updateUI();
  }

  void updateUI() async {
    var weatherData = await WeatherModel().getLocationWeather();
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get  weather data';
      cityName = '';
      isLoading = true;
    }
    getData(weatherData);
  }

  void getData(weatherData) {
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(temperature!);
    cityName = weatherData['name'];
    update();
    return;
  }
}
