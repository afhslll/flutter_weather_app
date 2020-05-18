import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

import './widgets/city_item.dart';
import './widgets/curloc_item.dart';
import '../../data/sample_cities.dart';
import '../../providers/cities.dart';
import '../../providers/weather.dart';

class AddCityScreen extends StatefulWidget {
  static const routeName = '/add-city';

  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  var sampleCities = [...SAMPLE_CITIES];
  var _isInit = true;

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  Future<void> _getCurrentUserLocation(BuildContext context) async {
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      final locData = await location.getLocation();
      if (locData != null) {
        final lat = locData.latitude;
        final lng = locData.longitude;
        final currentCity =
            await Provider.of<CurrentWeather>(context, listen: false)
                .fetchCurrentLocationName(lat, lng);
        Provider.of<Cities>(context, listen: false)
            .addCity(currentCity, '', lat, lng);
        Navigator.of(context).pop();
      }
    } catch (error) {
      print('location ERROR: $error');
      return;
    }
  }

  Future<void> _addCity(BuildContext context, dynamic sampleCity) async {
    var lat = double.parse(sampleCity['lat']);
    var lng = double.parse(sampleCity['lng']);
    Provider.of<Cities>(context, listen: false)
        .addCity(sampleCity['city'], sampleCity['admin'], lat, lng);
    Navigator.of(context).pop();
  }

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
      sampleCities.insert(0, {'city': 'Current Location'});
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
        itemBuilder: (ctx, i) => i == 0
            ? CurLocWidget(
                onSelect: () => _getCurrentUserLocation(context),
              )
            : CityItemWidget(
                title: sampleCities[i]['city'],
                subtitle: sampleCities[i]['admin'],
                onSelect: () => _addCity(context, sampleCities[i]),
              ),
      ),
    );
  }
}
