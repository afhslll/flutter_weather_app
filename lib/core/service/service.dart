import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/network/network_service.dart';

abstract class Service {
  Future<WeatherResponse> getCurrentWeather(
      {@required double lat, @required double lng});
  Future<ForecastResponse> getForecast(
      {@required double lat, @required double lng});
}

class ServiceImpl implements Service {
  final NetworkService _networkService = locator<NetworkServiceImpl>();
  @override
  Future<WeatherResponse> getCurrentWeather({double lat, double lng}) async {
    return await _networkService.getCurrentWeather(lat: lat, lng: lng);
  }

  @override
  Future<ForecastResponse> getForecast({double lat, double lng}) async {
    return await _networkService.getForecast(lat: lat, lng: lng);
  }
}
