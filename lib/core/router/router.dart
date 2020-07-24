import 'package:flutter/material.dart';
import 'package:flutter_weather_app/legacy/screens/home/screen.dart';

class Router {
  static const homeRoute = '/homeRoute';

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _pageRoute(HomeScreen());
      default:
        return _pageRoute(Scaffold(
          body: Center(child: Text('No route defined for ${settings?.name}')),
        ));
    }
  }
}
