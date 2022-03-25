import 'package:weatherflutter/network//weather_repository.dart';
import 'package:weatherflutter/network/location.dart';

import '../model/response/five_days_data.dart';
import '../model/response/weather_response.dart';

class WeatherService {
  final String city;
  String apiKey = '72563f9f739da2bb9f2c9a5da4013cc4';
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherService({required this.city});

  Future<dynamic> getCurrentWeather(
      {Function()? onLoading,
      Function(WeatherResponse weatherResponse)? onSuccess,
      Function(dynamic error)? onError}) async {
    Location location = Location();
    await location.getCurrentLocation();

    var uri = '$baseUrl?lat=${location.latitude}&lon='
        '${location.longitude}&appid=$apiKey&units=metric';

    WeatherRepository networkingHelper = WeatherRepository(uri: uri);
    var weatherData = await networkingHelper.getData();

    WeatherRepository(uri: uri, payLoad: null).get(
      onLoading: () => {if (onLoading != null) onLoading()},
      onSuccess: (data) =>
          {if (onSuccess != null) onSuccess(WeatherResponse.fromJson(data))},
      onError: (error) => {if (onError != null) onError(error)},
    );

    return weatherData;
  }

  Future<dynamic> getWeatherByCityName(
      {Function()? onLoading,
      Function(dynamic fiveDayData)? onSuccess,
      Function(dynamic error)? onError}) async {
    var uri = '$baseUrl?q=$city&appid=$apiKey&units=metric';
    WeatherRepository networkingHelper = WeatherRepository(
        uri: uri);
    var weatherData = await networkingHelper.getData();

    WeatherRepository(uri: uri, payLoad: null).get(
      onLoading: () => {if (onLoading != null) onLoading()},
      onSuccess: (data) =>
      {if (onSuccess != null) onSuccess(WeatherResponse.fromJson(data))},
      onError: (error) => {if (onError != null) onError(error)},
    );
    return weatherData;
  }

  void getWeatherOfSpacialCities({
    Function()? onLoading,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = 'https://api.openweathermap.org/data/2.5/forecast?q=$city&lang=en&$apiKey';

    WeatherRepository( uri: url, payload: null).get(
        onLoading: () => {},
        onSuccess: (data) => {
          onSuccess!((data['list'] as List)
              ?.map((t) => FiveDayData.fromJson(t))
              ?.toList() ??
              List.empty()),
        },
        onError: (error) => {
          print(error),
          onError!(error),
        });
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/thunder.jpg';
    } else if (condition < 400) {
      return 'assets/strong-rainy.jpg';
    } else if (condition < 600) {
      return 'assets/rainy.jpg';
    } else if (condition < 700) {
      return 'assets/snow.jpg';
    } else if (condition < 800) {
      return 'assets/cloudy.jpg';
    } else if (condition == 800) {
      return 'assets/sunny.jpg';
    } else if (condition <= 804) {
      return 'assets/fog.jpg';
    } else {
      return 'assets/weather.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

}
