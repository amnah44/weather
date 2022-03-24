import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherflutter/ui/location/controller.dart';
import 'package:weatherflutter/utilities/constants.dart';

class LocationScreen extends GetWidget<LocationController> {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (controller) => Scaffold(
        body: controller.weatherIcon != null
            ? SafeArea(
                child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: const ColorFilter.mode(
                          Colors.black12, BlendMode.darken),
                      image: AssetImage(
                        '${controller.weatherIcon}',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Stack(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.0, 1.5),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: OverflowBox(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 0.0,
                            maxHeight:
                                (MediaQuery.of(context).size.height / 2.7),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  '${controller.weatherResponse.name}',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ),
                                              const Divider(
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                    child: Text(
                                                      '${controller.weatherResponse.main?.temp?.toInt()}°',
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          ?.copyWith(
                                                            color: Colors.black87,
                                                            fontSize: 100,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${controller.weatherResponse.weather?[0].description}',
                                                     style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        ?.copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0, left: 15.0),
                                              child: Text(
                                                '${controller.weatherMessage}',
                                                textAlign: TextAlign.center,
                                                style: kMessageTextStyle,
                                              ),
                                            ),
                                            kSizeBoxHeight,
                                            Align(
                                              alignment:
                                                  const Alignment(0.85, 0.0),
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SpinKitCircle(
                color: Colors.lightBlueAccent,
                size: 100.0,
              ),
      ),
    );
  }
}
