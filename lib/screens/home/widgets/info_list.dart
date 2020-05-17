import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import './info_item.dart';
import '../../../providers/weather.dart';

class InfoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final weatherInfo = Provider.of<CurrentWeather>(context);
    return weatherInfo.currentWeather == null
        ? Container()
        : Container(
            color: Colors.green,
            width: double.infinity,
            height: screenSize.height / 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InfoItemWidget(
                    title: 'Sunrise',
                    icon: Icon(Icons.cloud),
                    value: DateFormat('Hm')
                        .format(weatherInfo.currentWeather.sunrise)
                        .toString()),
                InfoItemWidget(
                    title: 'Sunset',
                    icon: Icon(Icons.cloud),
                    value: DateFormat('Hm')
                        .format(weatherInfo.currentWeather.sunset)
                        .toString()),
                InfoItemWidget(
                    title: 'Humidity',
                    icon: Icon(Icons.cloud),
                    value: weatherInfo.currentWeather.humidity.toString()),
                InfoItemWidget(
                    title: 'Wind',
                    icon: Icon(Icons.cloud),
                    value: weatherInfo.currentWeather.wind.toString()),
              ],
            ));
  }
}
