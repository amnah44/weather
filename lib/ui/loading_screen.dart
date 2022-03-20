import 'package:flutter/material.dart';
import 'package:weatherflutter/ui/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherflutter/network/weather_model.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) {
        return  LocationScreen(locationWeather: weatherData);
      }),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitFadingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
