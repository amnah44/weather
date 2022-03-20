import 'package:flutter/material.dart';
import 'package:weatherflutter/network/weather_model.dart';
import 'package:weatherflutter/ui/city_screen.dart';
import 'package:weatherflutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get  weather data';
        cityName = '';
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature!);
      cityName = weatherData['name'];
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: kDecorationImage),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 40.0,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        var typeName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CityScreen();
                        }));
                        if (typeName != null) {
                          var weatherData =
                              await weather.getWeatherByCityName(typeName);
                          updateUI(weatherData);
                        }
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              kSizeBoxHeight,
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      weatherIcon!,
                      style: kConditionTextStyle,
                    ),
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Text(
                  '$weatherMessage in \n$cityName',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
