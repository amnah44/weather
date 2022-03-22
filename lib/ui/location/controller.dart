import 'package:get/get.dart';
import 'package:weatherflutter/data/location_data.dart';

import '../../network/weather_model.dart';

class LocationController extends GetxController {
  WeatherModel weather = WeatherModel();
  final locationData = LocationData().obs;

  @override
  void onInit() {
    updateUI();
    super.onInit();
  }

  void updateUI() async {
    var weatherData = await WeatherModel().getLocationWeather();
    getData(weatherData);
  }

  void getData(weatherData) {
    double temp = weatherData['main']['temp'];
    var condition = weatherData['weather'][0]['id'];

    locationData.update((value) {
      value?.temperature = temp.toInt();
      value?.weatherIcon = weather.getWeatherIcon(condition);
      value?.weatherMessage = weather.getMessage(value.temperature);
      value?.cityName = weatherData['name'];
    });
  }
}
