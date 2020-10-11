import 'package:flutter_weather_app/core/enum/view_state.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/core/service/service.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import 'base_model.dart';

class AddCityViewModel extends BaseModel {
  final Service _service = locator<ServiceImpl>();
  final NavigationService _navigationService = locator<NavigationService>();
  List<City> _availableCities = [];
  List<City> get availableCities => _availableCities;

  HomeViewModel _homeViewModel;
  set homeViewModel(HomeViewModel value) {
    _homeViewModel = value;
  }

  Future<void> getAvailableCities() async {
    setViewState(ViewState.busy);
    _availableCities = await _service.fetchMockCities();
    final savedCities = await _service.fetchCities();
    _availableCities.removeWhere((ac) =>
        (savedCities.singleWhere((ct) => ct.name == ac.name,
            orElse: () => null)) !=
        null);
    setViewState(ViewState.idle);
  }

  Future<void> addSavedCity(City city) async {
    await _service.insertCity(city: city);
    _navigationService.pop();
    await _homeViewModel.setupPage(toRefresh: true);
  }
}
