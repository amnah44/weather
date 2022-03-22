import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/network/weather_model.dart';
import 'package:weatherflutter/ui/location/controller.dart';
import 'package:weatherflutter/ui/search/search_screen.dart';
import 'package:weatherflutter/utilities/constants.dart';

class LocationScreen extends GetWidget<LocationController> {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LocationController>(
      init: LocationController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
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
                          return const SearchScreen();
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
                      controller.locationData.value.weatherIcon != null
                          ? '${controller.locationData.value.weatherIcon}'
                          : ' ',
                      style: kConditionTextStyle,
                    ),
                    controller.locationData.value.temperature != null
                        ? Text(
                            '${controller.locationData.value.temperature}°',
                            style: kTempTextStyle,
                          )
                        : const SpinKitCircle(
                            color: Colors.white,
                            size: 70.0,
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Text(
                  controller.locationData.value.weatherMessage != null
                      ? '${controller.locationData.value.weatherMessage}'
                          ' in \n${controller.locationData.value.cityName}'
                      : ' ',
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
