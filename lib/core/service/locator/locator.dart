import 'package:flutter_weather_app/core/service/network/network_service.dart';
import 'package:flutter_weather_app/core/service/sharedpreference/preferences_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PreferencesServiceImpl());
}
