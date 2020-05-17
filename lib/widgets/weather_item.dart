import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/weather.dart';

class WeatherItemWidget extends StatelessWidget {
  final Weather weather;

  WeatherItemWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Text(DateFormat('Hm').format(weather.dateTime).toString()),
      Icon(Icons.cloud),
      Text('${weather.temperature}°'),
    ]));
  }
}
