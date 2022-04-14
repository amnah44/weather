

import 'package:get/get.dart';

import '../../app/util/ConditionIcons.dart';
import '../../data/data_source/network/weather_service.dart';
import '../../data/model/five_days_data.dart';
import '../../data/model/weather_response.dart';

class Controller extends GetxController {
  String? city;
  String? weatherImage;
  String? weatherMessage;

  WeatherResponse weatherResponse = WeatherResponse();
  var weather = ConditionIcons();

  List<WeatherResponse> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  Controller({required this.city});

  @override
  void onInit() {
    getCurrentWeatherData();
    getSpecialCities();
    super.onInit();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeather(onSuccess: (data) {
      getData(data);
      weatherResponse = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
    getFiveDaysData();
    update();
  }

  void getWeatherDataByCityName(typeName) {
    WeatherService(city: '$city').getWeatherByCityName(onSuccess: (data) {
      getData(data);
      weatherResponse = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }

  void getData(data) {
    int? condition = data.weather?[0].id;
    int? temperature = data.main?.temp?.toInt();
    weatherImage = weather.getWeatherImage(condition!);
    weatherMessage = weather.getMessage(temperature!);
  }

  void getSpecialCities() {
    List<String> cities = [
      'London',
      'Paris',
      'Tokyo',
      'New York',
      'Moscow',
      'Roma',
      'Beijing',
      'Berlin',
      'Ottawa'
    ];
    for (var element in cities) {
      WeatherService(city: element).getWeatherByCityName(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    }
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getWeatherOfSpacialCities(onSuccess: (data) {
      fiveDaysData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }
}
