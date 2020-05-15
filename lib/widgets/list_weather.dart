import 'package:flutter/material.dart';

import './weather_item.dart';

class ListWeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.purple,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
        ]));
  }
}
