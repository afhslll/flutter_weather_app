import 'package:flutter_weather_app/core/enum/view_state.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/service.dart';
import 'base_model.dart';

class AddCityViewModel extends BaseModel {
  final Service _service = locator<ServiceImpl>();
  List<City> _availableCities = [];
  List<City> get availableCities => _availableCities;

  ViewState _viewState = ViewState.idle;
  ViewState get viewState => _viewState;
  void setViewState(ViewState value) {
    if (_viewState != value) {
      _viewState = value;
      notifyListeners();
    }
  }

  Future<void> getAvailableCities() async {
    setViewState(ViewState.busy);
    _availableCities = await _service.fetchMockCities();
    setViewState(ViewState.idle);
  }
}
