import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weatherflutter/weather/data/model/weather_response/weather_response.dart';
import 'package:weatherflutter/weather/presentation/custom_views/horizontal_list.dart';
import 'package:weatherflutter/weather/presentation/custom_views/weather_card_widget.dart';
import 'package:weatherflutter/weather/presentation/ui/controller.dart';

class LocationScreen extends GetWidget<Controller> {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (controller) => Scaffold(
        body: controller.weatherImage != null
            ? SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: WeatherCardWidget(controller: controller),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              padding: const EdgeInsets.only(top: 150),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'other city'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            fontSize: 16,
                                            fontFamily: 'flutterfonts',
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 150,
                                      child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            const VerticalDivider(
                                          color: Colors.transparent,
                                          width: 5,
                                        ),
                                        itemCount: controller.dataList.length,
                                        itemBuilder: (context, index) {
                                          WeatherResponse? data;
                                          (controller.dataList.isNotEmpty)
                                              ? data =
                                                  controller.dataList[index]
                                              : data = null;
                                          return HorizontalList(data: data);
                                        },
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
                  ],
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
