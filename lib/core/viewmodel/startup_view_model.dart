import 'package:flutter_weather_app/core/router/router.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> handleStartupLogic() async {
    Future.delayed(Duration.zero, () async {
      await _navigationService.pushAndRemoveUntil(NavigationRouter.homeRoute);
    });
  }
}
