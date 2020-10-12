import 'package:flutter/material.dart';
import 'weather.dart';

class DayForecast {
  final String day;
  final List<Weather> weathers;
  DayForecast({@required this.day, @required this.weathers});
}

class ForecastResponse {
  List<Weather> weathers;
  ForecastResponse({this.weathers});
  ForecastResponse.fromJson(List<dynamic> json) {
    weathers = json
        ?.map((e) => e == null
            ? null
            : Weather(
                dateTime: DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000),
                temperature: e['main']['temp'].toDouble(),
                description: e['weather'][0]['description'],
                icon: e['weather'][0]['icon'],
              ))
        ?.toList();
  }
}
