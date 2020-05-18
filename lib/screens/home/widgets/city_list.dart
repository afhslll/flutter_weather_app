import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './carousel_list.dart';
import '../../../providers/cities.dart';
import '../../../providers/weather.dart';
import '../../../providers/forecast.dart';

class CityListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: Consumer<Cities>(
        builder: (ctx, citiesData, child) => citiesData.addedCities.isEmpty
            ? Container()
            : CarouselListWidget(
                selectedIndex: citiesData.addedCities
                    .toList()
                    .indexWhere((city) => city == citiesData.defaultCity),
                cities: citiesData,
                onSelectCity: (index) {
                  Cities cities = citiesData;
                  City selectedCity =
                      cities.addedCities.toList().elementAt(index);
                  Provider.of<CurrentWeather>(context, listen: false)
                      .fetchAndSetCurrentWeather(
                          selectedCity.latitude, selectedCity.longitude);
                  Provider.of<Forecast>(context, listen: false)
                      .fetchAndSetForecast(
                          selectedCity.latitude, selectedCity.longitude);
                },
              ),
      ),
    ));
  }
}
