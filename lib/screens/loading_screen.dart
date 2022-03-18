import 'package:flutter/material.dart';
import 'package:weatherflutter/screens/location_screen.dart';
import 'package:weatherflutter/services/location.dart';
import 'package:weatherflutter/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const API_KEY = '72563f9f739da2bb9f2c9a5da4013cc4';

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
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?'
            'lat=${location.longitude}&lon=${location.latitude}'
            '&appid=$API_KEY&units=metric'));

    var weatherData = await networkingHelper.getData();
    print(weatherData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return  LocationScreen(weatherData);
      }),
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
