import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);
const kDecorationImage = DecorationImage(
    image: ExactAssetImage('images/sky.jpg'),
    fit: BoxFit.fill
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
  fontSize: 100.0,
);
const kSizeBoxHeight = SizedBox(
  height: 30.0,
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