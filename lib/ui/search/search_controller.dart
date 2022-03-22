import 'package:get/get.dart';
import 'package:weatherflutter/data/location_data.dart';

import '../../network/weather_model.dart';

class SearchController extends GetxController {
  final locationData = LocationData().obs;

  void getCityName() async {
    var weatherData =
        await WeatherModel().getWeatherByCityName(locationData.value.cityName);

    locationData.update((value) {
      value?.cityName = weatherData['name'];
    });
  }
}
