import 'package:flutter/material.dart';

import './widgets/day_item.dart';

class WeatherDetailScreen extends StatelessWidget {
  static const routeName = '/weather-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next 5 Days'),
      ),
      body: ListView(children: <Widget>[
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
        DayItemWidget(),
      ]),
    );
  }
}
