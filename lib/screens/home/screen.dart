import 'package:flutter/material.dart';

import './widgets/list_city.dart';
import './widgets/list_info.dart';
import '../../widgets/tab.dart';
import '../../widgets/list_weather.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ListCityWidget(),
        ListInfoWidget(),
        TabWidget(),
        ListWeatherWidget(),
      ],
    ));
  }
}
