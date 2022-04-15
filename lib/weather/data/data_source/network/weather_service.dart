import 'package:weatherflutter/weather/data/data_source/network/weather_location.dart';
import 'package:weatherflutter/weather/data/repository/weather_repository.dart';
import 'package:weatherflutter/weather/data/model/ten_days_data/five_days_data.dart';
import 'package:weatherflutter/weather/data/model/weather_response/weather_response.dart';

class WeatherService {
  final String city;
  String apiKey = '72563f9f739da2bb9f2c9a5da4013cc4';
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherService({required this.city});

  Future<dynamic> getCurrentWeather(
      {Function()? onLoading,
      Function(WeatherResponse weatherResponse)? onSuccess,
      Function(dynamic error)? onError}) async {
    WeatherLocation location = WeatherLocation();
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
    Function(List<TenDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = 'https://api.openweathermap.org/data/2.5/forecast?q=$city&lang=en&$apiKey';

    WeatherRepository( uri: url, payload: null).get(
        onLoading: () => {},
        onSuccess: (data) => {
          onSuccess!((data['list'] as List)
              ?.map((t) => TenDayData.fromJson(t))
              ?.toList() ??
              List.empty()),
        },
        onError: (error) => {
          print(error),
          onError!(error),
        });
  }
}
