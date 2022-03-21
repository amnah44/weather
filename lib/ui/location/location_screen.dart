import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/ui/location/controller.dart';
import 'package:weatherflutter/network/weather_model.dart';
import 'package:weatherflutter/ui/city_screen.dart';
import 'package:weatherflutter/utilities/constants.dart';

class LocationScreen extends GetWidget<LocationController> {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) => Scaffold(
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
                          var weatherData =
                              await WeatherModel().getLocationWeather();
                          controller.getData(weatherData);
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
                            var weatherData = await WeatherModel()
                                .getWeatherByCityName(typeName);
                            controller.getData(weatherData);
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
                        '${controller.weatherIcon}',
                        style: kConditionTextStyle,
                      ),
                      Text(
                        '${controller.temperature}°',
                        style: kTempTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Text(
                    '${controller.weatherMessage} in \n${controller.cityName}',
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
