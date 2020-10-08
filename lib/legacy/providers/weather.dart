import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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

class CurrentWeather with ChangeNotifier {
  Weather _currWeather;

  Weather get currentWeather {
    return _currWeather;
  }

  Future<void> fetchAndSetCurrentWeather(double lat, double lng) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&units=metric&appid=8431c1af723ec74b5e15ecf8656b25dc';
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }
    _currWeather = Weather(
        dateTime:
            DateTime.fromMillisecondsSinceEpoch(extractedData['dt'] * 1000),
        temperature: extractedData['main']['temp'].toDouble(),
        description: extractedData['weather'][0]['main'],
        sunrise: DateTime.fromMillisecondsSinceEpoch(
            extractedData['sys']['sunrise'] * 1000),
        sunset: DateTime.fromMillisecondsSinceEpoch(
            extractedData['sys']['sunset'] * 1000),
        wind: extractedData['wind']['speed'].toDouble(),
        humidity: extractedData['main']['humidity'].toDouble());
    notifyListeners();
  }

  Future<String> fetchCurrentLocationName(double lat, double lng) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&units=metric&appid=8431c1af723ec74b5e15ecf8656b25dc';
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return '';
    }
    return extractedData['name'];
  }
}
