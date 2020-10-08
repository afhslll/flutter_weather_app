import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import './weather.dart';

class Forecast with ChangeNotifier {
  Map<dynamic, List<Weather>> _forecast = {};

  Map<dynamic, List<Weather>> get forecast {
    return {..._forecast};
  }

  Future<void> fetchAndSetForecast(double lat, double lng) async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lng&units=metric&appid=8431c1af723ec74b5e15ecf8656b25dc';
    final response = await http.get(url);
    final List<Weather> loadedForecast = [];
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }
    final weatherList = extractedData['list'] as List<dynamic>;
    weatherList.forEach((weather) {
      loadedForecast.add(Weather(
          dateTime: DateTime.fromMillisecondsSinceEpoch(weather['dt'] * 1000),
          temperature: weather['main']['temp'].toDouble(),
          description: weather['weather'][0]['description'],
          icon: weather['weather'][0]['icon']));
    });
    var groupedForecast = groupBy(
        loadedForecast, (obj) => (DateFormat('EEEE').format(obj.dateTime)));
    _forecast = groupedForecast;
    notifyListeners();
  }
}
