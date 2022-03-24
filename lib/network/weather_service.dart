import 'package:weatherflutter/network//weather_repository.dart';
import 'package:weatherflutter/network/location.dart';
import '../model/response/weather_response.dart';

class WeatherService {
  final String city;
  String apiKey = '72563f9f739da2bb9f2c9a5da4013cc4';
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherService({required this.city});

  Future<dynamic> getCurrentWeather({
    Function()? onLoading,
    Function(WeatherResponse weatherResponse)? onSuccess,
    Function(dynamic error)? onError}) async{
    Location location = Location();
    await location.getCurrentLocation();

    var uri =  '$baseUrl?lat=${location.latitude}&lon='
        '${location.longitude}&appid=$apiKey&units=metric';

    WeatherRepository networkingHelper =
    WeatherRepository(uri:uri);
    var weatherData = await networkingHelper.getData();

    WeatherRepository(uri: uri, payLoad: null).get(
      onLoading: () => {if (onLoading != null) onLoading()},
      onSuccess: (data) => {if (onSuccess != null) onSuccess(WeatherResponse.fromJson(data))},
      onError: (error) => {if (onError != null) onError(error)},
    );

    return weatherData;
  }

  void getFiveDaysWeatherData({
  Function()? onLoading,
  Function(dynamic fiveDayData)? onSuccess,
  Function(dynamic error)? onError}){
    // final uri = ''
}
  // Future<dynamic> getWeatherByCityName(String cityName) async {
  //   WeatherRepository networkingHelper = WeatherRepository(
  //       Uri.parse('$BASIC_URI?q=$cityName&appid=$API_KEY&units=metric'));
  //   var weatherData = await networkingHelper.getData();
  //
  //   return weatherData;
  // }
  //

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
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
