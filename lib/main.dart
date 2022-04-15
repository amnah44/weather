import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/weather/presentation/ui/location/location_screen.dart';
import 'package:weatherflutter/weather_binding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      initialBinding: LocationBinding(),
      home: const LocationScreen(),
    );
  }
}
