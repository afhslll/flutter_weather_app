import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_weather_app/ui/view/splash/splash_screen.dart';
import 'core/service/localization/localization_service.dart';
import 'core/constant/strings_constant.dart';
import 'core/router/router.dart';
import 'ui/shared/style/theme_data.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();
    localizationService.onLocaleChangedCallback = _onLocaleChanged();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantStrings.appName,
      onGenerateRoute: Router.generateRoute,
      home: SplashScreen(),
      theme: defaultThemeData,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: localizationService.supportedLocales(),
    );
  }

  dynamic _onLocaleChanged() => print(
      'Language has been changed to: ${localizationService.currentLanguage}');
}
