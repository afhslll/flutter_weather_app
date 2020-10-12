import 'package:flutter_weather_app/core/router/router.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/core/service/service.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final Service _service = locator<ServiceImpl>();

  Future<void> handleStartupLogic() async {
    final result = await _service.fetchCities();
    if (result.isEmpty) {
      await _addDefaultCities();
    }
    await _navigationService.pushAndRemoveUntil(NavigationRouter.homeRoute);
  }

  Future<void> _addDefaultCities() async {
    final availableCities = await _service.fetchMockCities();
    if (availableCities.isNotEmpty) {
      int defaultCount = 3;
      if (availableCities.length < 3) {
        defaultCount = availableCities.length;
      }
      final defaultCities = availableCities.take(defaultCount).toList();
      for (City c in defaultCities) {
        await _service.insertCity(city: c);
      }
    }
  }
}
