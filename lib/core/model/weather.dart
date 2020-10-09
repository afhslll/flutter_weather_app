import 'package:flutter/material.dart';

class Weather {
  final DateTime dateTime;
  final double temperature;
  final String description;
  final DateTime sunrise;
  final DateTime sunset;
  final double wind;
  final double humidity;
  final String icon;

  Weather(
      {@required this.dateTime,
      @required this.temperature,
      @required this.description,
      this.sunrise,
      this.sunset,
      this.wind,
      this.humidity,
      this.icon});
}
