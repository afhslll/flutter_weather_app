import 'package:flutter/material.dart';

class WeatherItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Text('10:45'),
      Icon(Icons.cloud),
      Text('30°'),
    ]));
  }
}
