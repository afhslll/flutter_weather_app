import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import './info_item.dart';
import '../../../providers/weather.dart';

class InfoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherInfo = Provider.of<CurrentWeather>(context);
    return weatherInfo.currentWeather == null
        ? Container()
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                color: Color(0xFFFCBF49)),
            margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            height: 120,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InfoItemWidget(
                    title: 'Sunrise',
                    icon: Icon(
                      Icons.brightness_low,
                      color: Color(0xFFEC6E4C),
                    ),
                    value: DateFormat('Hm')
                        .format(weatherInfo.currentWeather.sunrise)
                        .toString()),
                InfoItemWidget(
                    title: 'Sunset',
                    icon: Icon(
                      Icons.brightness_medium,
                      color: Color(0xFFEC6E4C),
                    ),
                    value: DateFormat('Hm')
                        .format(weatherInfo.currentWeather.sunset)
                        .toString()),
                InfoItemWidget(
                    title: 'Humidity',
                    icon: Icon(
                      Icons.opacity,
                      color: Color(0xFFEC6E4C),
                    ),
                    value:
                        '${weatherInfo.currentWeather.humidity.toString()}%'),
                InfoItemWidget(
                    title: 'Wind',
                    icon: Icon(
                      Icons.cloud_queue,
                      color: Color(0xFFEC6E4C),
                    ),
                    value: '${weatherInfo.currentWeather.wind.toString()} m/s'),
              ],
            ));
  }
}
