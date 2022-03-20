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
        padding: const EdgeInsets.only(top: 10.0),
        color: Colors.white,
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
                    color: Colors.lightBlueAccent,
                    size: 40.0,
                  ),
                ),
              ),
              kSizeBoxHeight,
              Container(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0),
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
