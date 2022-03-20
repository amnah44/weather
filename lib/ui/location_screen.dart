import 'package:flutter/material.dart';
import 'package:weatherflutter/network/api_weather.dart';
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
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
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
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              kSizeBoxHeight,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Expanded(
                  child: Center(
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.left,
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
