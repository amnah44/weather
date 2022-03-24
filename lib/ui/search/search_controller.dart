// import 'package:get/get.dart';
// import '../../model/data/location_data.dart';
// import '../../network/weather_service.dart';
//
// class SearchController extends GetxController {
//   final locationData = LocationData().obs;
//
//   void getCityName() async {
//     var weatherData =
//         await WeatherService().getWeatherByCityName('${locationData.value.cityName}');
//
//     locationData.update((value) {
//       value?.cityName = weatherData['name'];
//     });
//   }
// }
