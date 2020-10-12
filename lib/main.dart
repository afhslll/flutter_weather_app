import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/constant/string_constant.dart';
import 'package:flutter_weather_app/core/router/router.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/ui/shared/theme_data.dart';
import 'package:flutter_weather_app/ui/view/splash/splash_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultThemeData,
      title: ConstantString.appName,
      onGenerateRoute: NavigationRouter.generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      home: SplashScreen(),
    );
  }
}
