import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/weather/app/util/constants.dart';
import '../controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (builder) => Scaffold(
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
                      builder.update();
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
                      builder.city = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MaterialButton(
                  onPressed: () {
                      Navigator.pop(context, builder.city);
                      builder.update();
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
      ),
    );
  }
}

