import 'package:flutter_weather_app/core/constant/string_constant.dart';
import 'package:flutter_weather_app/core/enum/view_state.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/service.dart';
import 'package:flutter_weather_app/core/utils/utils.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final Service _service = locator<ServiceImpl>();

  List<City> _userCities = [];
  List<City> get userCities => _userCities;

  City _selectedCity;
  City get selectedCity => _selectedCity;
  set selectedCity(City value) {
    _selectedCity = value;
  }

  int _selectedCityIndex;
  int get selectedCityIndex => _selectedCityIndex;
  set selectedCityIndex(int value) {
    _selectedCityIndex = value;
  }

  Weather _currentWeather;
  Weather get currentWeather => _currentWeather;

  List<Weather> _currentForecast;
  List<Weather> get currentForecast => _currentForecast;

  ForecastResponse _forecastResponse;
  ForecastResponse get forecastResponse => _forecastResponse;

  Future<void> setupPage() async {
    await getUserCities();
    await getWeatherAndForecast();
  }

  Future<void> getUserCities() async {
    setViewState(ViewState.busy);
    _userCities = await _service.fetchCities();
    if (_userCities.isNotEmpty) {
      final idx =
          _userCities.indexWhere((c) => c.name == ConstantString.defaultCity);
      _selectedCityIndex = idx == -1 ? 0 : idx;
      _selectedCity = _userCities[_selectedCityIndex];
    }
    setViewState(ViewState.idle);
  }

  Future<void> getWeatherAndForecast() async {
    setViewState(ViewState.busy);
    try {
      final wr = await _service.getCurrentWeather(
          lat: _selectedCity.latitude, lng: _selectedCity.longitude);
      _currentWeather = wr.weather;
      print(_currentWeather.toString());
      _forecastResponse = await _service.getForecast(
          lat: _selectedCity.latitude, lng: _selectedCity.longitude);
      _currentForecast = _forecastResponse.weathers
          .where((element) =>
              isSameDay(element.dateTime, _currentWeather.dateTime))
          .toList();
      setViewState(ViewState.idle);
    } catch (e) {
      print(e.toString());
      setViewState(ViewState.error);
    }
  }
}
