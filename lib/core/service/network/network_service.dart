import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/constant/url_constant.dart';
import 'package:flutter/material.dart';
import 'network_util.dart';

abstract class NetworkService {
  Future<WeatherResponse> getCurrentWeather(
      {@required double lat, @required double lng});
  Future<ForecastResponse> getForecast(
      {@required double lat, @required double lng});
}

class NetworkServiceImpl implements NetworkService {
  final APIRequest _api = locator<APIRequest>();
  final String forecastData = 'list';

  @override
  Future<WeatherResponse> getCurrentWeather({double lat, double lng}) async {
    final result = await _api.get(ConstantUrl.getWeatherUrl(lat, lng));
    return WeatherResponse.fromJson(result);
  }

  @override
  Future<ForecastResponse> getForecast({double lat, double lng}) async {
    final result = await _api.get(ConstantUrl.getForecastUrl(lat, lng));
    return ForecastResponse.fromJson(result[forecastData]);
  }
}
