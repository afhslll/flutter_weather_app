import 'dart:convert';
import 'package:flutter_weather_app/core/data/mock_json_data.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/model/forecast.dart';
import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/service/database/database_service.dart';
import 'package:flutter_weather_app/core/service/location/location_service.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/network/network_service.dart';

abstract class Service {
  Future<WeatherResponse> getCurrentWeather(
      {@required double lat, @required double lng});
  Future<ForecastResponse> getForecast(
      {@required double lat, @required double lng});
  Future<int> insertCity({@required City city});
  Future<List<City>> fetchCities();
  Future<List<City>> fetchMockCities();
  Future<City> getCurrentLocation();
}

class ServiceImpl implements Service {
  final NetworkService _networkService = locator<NetworkServiceImpl>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final LocationService _locationService = locator<LocationServiceImpl>();
  @override
  Future<WeatherResponse> getCurrentWeather({double lat, double lng}) async {
    return await _networkService.getCurrentWeather(lat: lat, lng: lng);
  }

  @override
  Future<ForecastResponse> getForecast({double lat, double lng}) async {
    return await _networkService.getForecast(lat: lat, lng: lng);
  }

  @override
  Future<int> insertCity({City city}) async {
    final db = await _databaseService.database;
    return await db.insert(City.table, city.toMap());
  }

  @override
  Future<List<City>> fetchCities() async {
    final db = await _databaseService.database;
    final result = await db.query(City.table);
    return result.isEmpty ? [] : result.map((e) => City.fromMap(e)).toList();
  }

  @override
  Future<List<City>> fetchMockCities() async {
    final result = await MockJsonProvider.getCitiesMockJson();
    final cities = json.decode(result) as List<dynamic>;
    return cities.map((e) => City.fromMockMap(e)).toList();
  }

  @override
  Future<City> getCurrentLocation() async {
    return await _locationService.getCurrentLocation();
  }
}
