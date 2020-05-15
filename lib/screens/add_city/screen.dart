import 'package:flutter/material.dart';

import './widgets/city_item.dart';

class AddCityScreen extends StatelessWidget {
  static const routeName = '/add-city';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add City'),
      ),
      body: ListView(children: <Widget>[
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
        CityItemWidget(),
      ]),
    );
  }
}
