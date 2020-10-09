import 'package:get_it/get_it.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/core/viewmodel/startup_view_model.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import 'package:flutter_weather_app/core/viewmodel/add_city_view_model.dart';
import 'package:flutter_weather_app/core/viewmodel/weather_detail_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => AddCityViewModel());
  locator.registerFactory(() => WeatherDetailViewModel());
}
