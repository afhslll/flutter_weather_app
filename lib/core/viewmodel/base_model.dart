import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/enum/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _viewState;
  ViewState get viewState => _viewState;

  void setViewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }
}
