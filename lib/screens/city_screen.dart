import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherflutter/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 40.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  autofocus: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context, cityName);
                  });
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
