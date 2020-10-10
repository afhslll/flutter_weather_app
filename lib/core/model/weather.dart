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

  @override
  String toString() {
    return 'Weather{dateTime: $dateTime, temperature: $temperature, description: $description, sunrise: $sunrise, sunset: $sunset, wind: $wind, humidity: $humidity, icon: $icon}';
  }
}

class WeatherResponse {
  Weather weather;
  WeatherResponse({this.weather});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    weather = Weather(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['main'],
      sunrise:
          DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
      wind: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
    );
  }
}
