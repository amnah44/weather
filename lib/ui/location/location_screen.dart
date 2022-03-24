import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/network/weather_service.dart';
import 'package:weatherflutter/ui/location/controller.dart';
import 'package:weatherflutter/ui/search/search_screen.dart';
import 'package:weatherflutter/utilities/constants.dart';

class LocationScreen extends GetWidget<LocationController> {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
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
                      // onPressed: () async {
                      //   var weatherData =
                      //       await WeatherService().getLocationWeather();
                      //   controller.getData(weatherData);
                      // },
                      onPressed: () {

                      },
                      child: const Icon(
                        Icons.refresh,
                        color: Colors.lightBlueAccent,
                        size: 40.0,
                      ),
                    ),
                    MaterialButton(
                      // onPressed: () async {
                      //   var typeName = await Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) {
                      //     return const SearchScreen();
                      //   }));
                      //   if (typeName != null) {
                      //     var weatherData = await WeatherService()
                      //         .getWeatherByCityName(typeName);
                      //     controller.getData(weatherData);
                      //   }
                      // },
                      onPressed: () {

                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.lightBlueAccent,
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
                    (controller.weatherIcon != null) ?
                    Text(
                      '${controller.weatherIcon}',
                      style: kConditionTextStyle,
                    ): const Text(' '),
                    controller.weatherResponse.main?.temp != null
                        ? Text(
                            '${controller.weatherResponse.main?.temp?.toInt()}°',
                            style: kTempTextStyle,
                          )
                        : const SpinKitCircle(
                            color: Colors.lightBlueAccent,
                            size: 70.0,
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Text(
                  controller.weatherMessage != null
                      ? '${controller.weatherMessage}'
                          ' in \n${controller.weatherResponse.name}'
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
