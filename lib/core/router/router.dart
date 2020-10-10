import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/view/home/home_screen.dart';
import 'package:flutter_weather_app/ui/view/add_city/add_city_screen.dart';
import 'package:flutter_weather_app/ui/view/weather_detail/weather_detail_screen.dart';

class NavigationRouter {
  static const String homeRoute = 'homeRoute';
  static const String addCityRoute = 'addCityRoute';
  static const String weatherDetailRoute = 'weatherDetailRoute';

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _pageRoute(HomeScreen());
      case addCityRoute:
        return _pageRoute(AddCityScreen());
      case weatherDetailRoute:
        return _pageRoute(WeatherDetailScreen(
          arguments: settings.arguments,
        ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings?.name}'),
                  ),
                ));
    }
  }
}
