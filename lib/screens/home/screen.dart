import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/city_list.dart';
import './widgets/info_list.dart';
import './widgets/tab_list.dart';
import '../../widgets/weather_list.dart';
import '../../providers/forecast.dart';
import '../../providers/weather.dart';
import '../../providers/cities.dart';
import '../add_city/screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      final citiesProvider = Provider.of<Cities>(context, listen: false);
      await citiesProvider.fetchAndSetAddedCities();
      final latitude = citiesProvider.defaultCity.latitude;
      final longitude = citiesProvider.defaultCity.longitude;
      Provider.of<CurrentWeather>(context, listen: false)
          .fetchAndSetCurrentWeather(latitude, longitude);
      Provider.of<Forecast>(context, listen: false)
          .fetchAndSetForecast(latitude, longitude);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddCityScreen.routeName);
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            CityListWidget(),
            InfoListWidget(),
            TabListWidget(),
            Consumer<Forecast>(
              builder: (ctx, forecastData, child) =>
                  forecastData.forecast.isEmpty
                      ? Container()
                      : WeatherListWidget(forecastData.forecast.values.first),
            )
          ],
        ));
  }
}
