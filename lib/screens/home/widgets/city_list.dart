import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './carousel_list.dart';
import '../../../providers/cities.dart';
import '../../../providers/weather.dart';
import '../../../providers/forecast.dart';

class CityListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height / 2,
      color: Colors.redAccent,
      child: Consumer<Cities>(
        builder: (ctx, citiesData, child) =>
            citiesData.addedCities.values.isEmpty
                ? Container()
                : CarouselListWidget(
                    selectedIndex: citiesData.addedCities.values
                        .toList()
                        .indexWhere((city) => city == citiesData.defaultCity),
                    cities: citiesData,
                    onSelectCity: (index) {
                      Cities cities = citiesData;
                      City selectedCity =
                          cities.addedCities.values.toList().elementAt(index);
                      Provider.of<CurrentWeather>(context, listen: false)
                          .fetchAndSetCurrentWeather(
                              selectedCity.latitude, selectedCity.longitude);
                      Provider.of<Forecast>(context, listen: false)
                          .fetchAndSetForecast(
                              selectedCity.latitude, selectedCity.longitude);
                      Provider.of<Cities>(context, listen: false)
                          .setDefaultCity(selectedCity);
                    },
                  ),
      ),
    );
  }
}
