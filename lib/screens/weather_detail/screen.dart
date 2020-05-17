import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/day_item.dart';
import '../../providers/forecast.dart';

class WeatherDetailScreen extends StatelessWidget {
  static const routeName = '/weather-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Next 5 Days'),
        ),
        body: Consumer<Forecast>(
            builder: (ctx, forecastData, child) => forecastData.forecast.isEmpty
                ? Container()
                : ListView.builder(
                    itemCount: forecastData.forecast.length - 1,
                    itemBuilder: (ctx, i) => DayItemWidget(
                          day: forecastData.forecast.keys
                              .elementAt(i + 1)
                              .toString(),
                          weathers:
                              forecastData.forecast.values.elementAt(i + 1),
                        ))));
  }
}
