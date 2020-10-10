import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class CityList extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const CityList({@required this.homeViewModel});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          child: Selector<HomeViewModel, Tuple2<List<City>, int>>(
              selector: (context, viewModel) =>
                  Tuple2(viewModel.userCities, viewModel.selectedCityIndex),
              builder: (context, value, child) {
                final cities = value?.item1;
                final selectedIndex = value?.item2;
                if (cities.isEmpty && selectedIndex == null) {
                  return Container();
                }
                return CarouselSlider.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return _buildCarouselItem(city: cities[index]);
                  },
                  options: CarouselOptions(
                      initialPage: selectedIndex,
                      aspectRatio: 1.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        homeViewModel.selectedCity = cities[index];
                        homeViewModel.getCurrentWeather();
                      }),
                );
              })),
    );
  }

  Widget _buildCarouselItem({City city}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10.0,
              offset: Offset(0.0, 5.0))
        ],
      ),
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
      padding: EdgeInsets.all(12.0),
      child: Selector<HomeViewModel, Weather>(
        selector: (context, viewModel) => viewModel.currentWeather,
        builder: (context, weather, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    city?.name ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _formatDateTime(weather?.dateTime),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                '${weather?.temperature?.toStringAsFixed(0) ?? ''}°',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                weather?.description ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ]),
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    if (dt != null) {
      final day = DateFormat('EEEE').format(dt).toString();
      final date = DateFormat('yMMMd').format(dt).toString();
      return '$day, $date';
    }
    return '';
  }
}
