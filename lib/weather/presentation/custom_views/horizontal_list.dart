import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key, this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (data != null)
                  ? '${data.name}'
                  : '',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
                color: Colors.black45,
                fontFamily:
                'flutterfonts',
              ),
            ),
            Text(
              (data != null)
                  ? '${data.main?.temp?.toInt()}°'
                  : '',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(
                fontSize: 50,
                fontWeight:
                FontWeight.bold,
                color: Colors.black45,
                fontFamily:
                'flutterfonts',
              ),
            ),
            Text(
              (data != null)
                  ? '${data.weather?[0].description}'
                  : '',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(
                color: Colors.black45,
                fontFamily:
                'flutterfonts',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
