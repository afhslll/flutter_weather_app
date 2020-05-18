import 'package:flutter/foundation.dart';

import '../data/sample_cities.dart';
import '../helpers/db_helper.dart';

class City {
  final String name;
  final String state;
  final double latitude;
  final double longitude;

  City(
      {@required this.name,
      @required this.state,
      @required this.latitude,
      @required this.longitude});
}

class Cities with ChangeNotifier {
  List<City> _addedCities = [];
  City _defaultCity;

  List<City> get addedCities {
    return [..._addedCities];
  }

  City get defaultCity {
    return _defaultCity;
  }

  void addCity(String name, String state, double latitude, double longitude) {
    City cityToAdd = City(
        name: name, state: state, latitude: latitude, longitude: longitude);
    _addedCities.add(cityToAdd);
    notifyListeners();
    DBHelper.insert('user_cities', {
      'name': name,
      'state': state,
      'latitude': latitude,
      'longitude': longitude
    });
  }

  void addDefaultCities() {
    final citiesToAdd = SAMPLE_CITIES.take(3).toList();
    citiesToAdd.forEach((city) {
      City cityToAdd = City(
          name: city['city'],
          state: city['admin'],
          latitude: double.parse(city['lat']),
          longitude: double.parse(city['lng']));
      _addedCities.add(cityToAdd);
      if (city['city'] == 'Kuala Lumpur') {
        setDefaultCity(cityToAdd);
      }
      DBHelper.insert('user_cities', {
        'name': city['city'],
        'state': city['admin'],
        'latitude': double.parse(city['lat']),
        'longitude': double.parse(city['lng'])
      });
    });
    notifyListeners();
  }

  void setDefaultCity(City city) {
    _defaultCity = city;
    notifyListeners();
  }

  Future<void> fetchAndSetAddedCities() async {
    final dataList = await DBHelper.getData('user_cities');
    print('DB user_cities ${dataList.length}');
    if (dataList.length == 0) {
      addDefaultCities();
    } else {
      dataList.forEach((item) {
        City cityToAdd = City(
            name: item['name'],
            state: item['state'],
            latitude: item['latitude'],
            longitude: item['longitude']);
        _addedCities.add(cityToAdd);
        if (item['name'] == 'Kuala Lumpur') {
          setDefaultCity(cityToAdd);
        }
      });
    }
    notifyListeners();
  }
}
