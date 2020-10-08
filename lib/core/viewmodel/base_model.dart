import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/enum/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
