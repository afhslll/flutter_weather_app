import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/weather.dart';

class WeatherItemWidget extends StatelessWidget {
  final Weather weather;

  WeatherItemWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 64.0,
        margin: EdgeInsets.all(6.0),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(DateFormat('Hm').format(weather.dateTime).toString()),
              SizedBox(
                height: 2.0,
              ),
              Image.network(
                  'http://openweathermap.org/img/wn/${weather.icon}@2x.png',
                  height: 40,
                  fit: BoxFit.contain),
              SizedBox(
                height: 2.0,
              ),
              Text('${weather.temperature.toStringAsFixed(0)}°',
                  style: TextStyle(color: Colors.grey[600])),
            ]));
  }
}
