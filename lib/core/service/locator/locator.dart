import 'package:flutter_weather_app/core/service/database/database_service.dart';
import 'package:flutter_weather_app/core/service/network/network_service.dart';
import 'package:flutter_weather_app/core/service/network/network_util.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/core/service/service.dart';
import 'package:flutter_weather_app/core/viewmodel/startup_view_model.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import 'package:flutter_weather_app/core/viewmodel/add_city_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => APIRequest());
  locator.registerLazySingleton(() => NetworkServiceImpl());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => ServiceImpl());

  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => AddCityViewModel());
}
