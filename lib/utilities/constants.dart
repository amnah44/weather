import 'package:flutter/material.dart';

class Images {
  Images._();
  static const String cloudyAnim = 'assets/anim/cloudy.json';
  static const String cloudyMain = 'assets/anim/cloudy_main.json';
}

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 20.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.lightBlueAccent,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 40.0,
);
const kSizeBoxHeight = SizedBox(
  height: 25.0,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.search,
    color: Colors.lightBlueAccent,
  ),
  hintText: 'London',
  contentPadding: EdgeInsets.all(15.0),
  hintStyle: TextStyle(color: Colors.blueGrey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
);