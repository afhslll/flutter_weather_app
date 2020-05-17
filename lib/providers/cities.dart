import 'package:flutter/foundation.dart';

import '../data/sample_cities.dart';

class City {
  final String id;
  final String name;
  final String state;
  final double latitude;
  final double longitude;

  City(
      {@required this.id,
      @required this.name,
      @required this.state,
      @required this.latitude,
      @required this.longitude});
}

class Cities with ChangeNotifier {
  Map<String, City> _addedCities = {};
  City _defaultCity;

  Map<String, City> get addedCities {
    return {..._addedCities};
  }

  City get defaultCity {
    return _defaultCity;
  }

  void addCity(String cityId, String name, String state, double latitude,
      double longitude) {
    City cityToAdd = City(
        id: cityId,
        name: name,
        state: state,
        latitude: latitude,
        longitude: longitude);
    _addedCities.putIfAbsent(
      cityId,
      () => cityToAdd,
    );
    setDefaultCity(cityToAdd);
    notifyListeners();
  }

  void addDefaultCities() {
    final citiesToAdd = SAMPLE_CITIES.take(3).toList();
    citiesToAdd.forEach((city) {
      City cityToAdd = City(
          id: city['city'],
          name: city['city'],
          state: city['admin'],
          latitude: double.parse(city['lat']),
          longitude: double.parse(city['lng']));
      if (city['city'] == 'Kuala Lumpur') {
        setDefaultCity(cityToAdd);
      }
      _addedCities.putIfAbsent(
        city['city'],
        () => cityToAdd,
      );
    });
  }

  void setDefaultCity(City city) {
    _defaultCity = city;
  }
}
