import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

import './weather.dart';

class Day {
  final int dateTime;
  final List<Weather> weathers;

  Day({@required this.dateTime, @required this.weathers});
}

class Days with ChangeNotifier {
  List<Day> _days = [];

  List<Day> get days {
    return [..._days];
  }

  Future<void> fetchAndSetDays() async {
    const url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=3.136569&lon=101.687083&appid=8431c1af723ec74b5e15ecf8656b25dc';
    final response = await http.get(url);
    final List<Weather> loadedWeathers = [];
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }
    final weatherList = extractedData['list'] as List<dynamic>;
    weatherList.forEach((weather) {
      loadedWeathers.add(Weather(
        dateTime: weather['dt'],
        temperature: weather['main']['temp'],
        description: weather['weather'][0]['description'],
      ));
    });
    var groupedWeathers = groupBy(
        loadedWeathers,
        (obj) =>
            (DateTime.fromMillisecondsSinceEpoch(obj.dateTime * 1000).day));
    final List<Day> loadedDays = [];
    groupedWeathers.forEach((key, value) {
      // loadedDays.add(Day(dateTime: value[0].dateTime, weathers: value));
    });
    _days = loadedDays;
    notifyListeners();
  }
}
