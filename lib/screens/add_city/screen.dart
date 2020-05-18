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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success!"),
          content: Text("New city has been successfully added."),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _addCityCurrentLocation(BuildContext context) async {
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
            .addCity(currentCity, '', lat, lng, true);
        Navigator.of(context).pop();
        _showDialog();
      }
    } catch (error) {
      print('location ERROR: $error');
      return;
    }
  }

  Future<void> _addCityManual(BuildContext context, dynamic sampleCity) async {
    var lat = double.parse(sampleCity['lat']);
    var lng = double.parse(sampleCity['lng']);
    Provider.of<Cities>(context, listen: false)
        .addCity(sampleCity['city'], sampleCity['admin'], lat, lng, false);
    Navigator.of(context).pop();
    _showDialog();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var sc = [...sampleCities];
      final cities = Provider.of<Cities>(context);
      sc.removeWhere((city) => ((cities.addedCities.singleWhere(
              (ct) => ct.name == city['city'],
              orElse: () => null)) !=
          null));
      sc.insert(0, {'city': 'Current Location'});
      setState(() {
        sampleCities = sc;
      });
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
                onSelect: () => _addCityCurrentLocation(context),
              )
            : CityItemWidget(
                title: sampleCities[i]['city'],
                subtitle: sampleCities[i]['admin'],
                onSelect: () => _addCityManual(context, sampleCities[i]),
              ),
      ),
    );
  }
}
