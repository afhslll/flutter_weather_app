import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home/screen.dart';
import './screens/add_city/screen.dart';
import './screens/weather_detail/screen.dart';
import './providers/cities.dart';
import './providers/weather.dart';
import './providers/forecast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Cities()),
          ChangeNotifierProvider.value(value: CurrentWeather()),
          ChangeNotifierProvider.value(value: Forecast()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: Color(0xFF003049)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomeScreen(),
            routes: {
              AddCityScreen.routeName: (ctx) => AddCityScreen(),
              WeatherDetailScreen.routeName: (ctx) => WeatherDetailScreen(),
            }));
  }
}
