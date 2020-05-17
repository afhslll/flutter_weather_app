import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/city_item.dart';
import '../../data/sample_cities.dart';
import '../../providers/cities.dart';

class AddCityScreen extends StatefulWidget {
  static const routeName = '/add-city';

  @override
  _AddCityScreen createState() => _AddCityScreen();
}

class _AddCityScreen extends State<AddCityScreen> {
  var sampleCities = [...SAMPLE_CITIES];
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final cities = Provider.of<Cities>(context);
      sampleCities.removeWhere((city) => ((cities.addedCities.singleWhere(
              (ct) => ct.name == city['city'],
              orElse: () => null)) !=
          null));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add City'),
      ),
      body: ListView.builder(
        itemCount: sampleCities.length,
        itemBuilder: (ctx, i) => CityItemWidget(
          title: sampleCities[i]['city'],
          subtitle: sampleCities[i]['admin'],
          onSelect: () {
            Provider.of<Cities>(context, listen: false).addCity(
                sampleCities[i]['city'],
                sampleCities[i]['city'],
                sampleCities[i]['admin'],
                double.parse(sampleCities[i]['lat']),
                double.parse(sampleCities[i]['lng']));
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
