import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/shared/style/theme_color.dart';

final ThemeData defaultThemeData = ThemeData(
  primaryColor: ThemeColor.brand01,
  fontFamily: 'Roboto',
  accentColor: ThemeColor.brand01,
  scaffoldBackgroundColor: ThemeColor.white,
  appBarTheme: AppBarTheme(color: ThemeColor.white, elevation: 0),
  primaryTextTheme: TextTheme(headline6: TextStyle(color: ThemeColor.black)),
  textTheme: TextTheme(bodyText2: TextStyle(color: ThemeColor.black)),
  primaryIconTheme:
      const IconThemeData.fallback().copyWith(color: ThemeColor.black),
);
