import 'package:flutter_weather_app/core/model/weather.dart';

class WeatherDetailArgument {
  Map<String, List<Weather>> dayForecast;
  WeatherDetailArgument({this.dayForecast});
}
