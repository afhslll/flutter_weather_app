import 'package:flutter/material.dart';

import './weather_item.dart';
import '../providers/weather.dart';

class WeatherListWidget extends StatelessWidget {
  final List<Weather> weathers;

  WeatherListWidget(this.weathers);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.purple,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weathers.length,
            itemBuilder: (ctx, i) => WeatherItemWidget(weathers[i])));
  }
}
