import 'package:get/get.dart';
import '../../model/data/location_data.dart';
import '../../network/weather_model.dart';

class SearchController extends GetxController {
  final locationData = LocationData().obs;

  void getCityName() async {
    var weatherData =
        await WeatherModel().getWeatherByCityName('${locationData.value.cityName}');

    locationData.update((value) {
      value?.cityName = weatherData['name'];
    });
  }
}
