import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './carousel_item.dart';
import '../../../providers/cities.dart';

class CarouselListWidget extends StatelessWidget {
  final Cities cities;
  final Function onSelectCity;
  final int selectedIndex;

  CarouselListWidget(
      {@required this.cities,
      @required this.onSelectCity,
      @required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
          initialPage: selectedIndex,
          aspectRatio: 1.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: false,
          onPageChanged: (index, reason) {
            onSelectCity(index);
          }),
      items: cities.addedCities.values
          .map((e) => CarouselItemWidget(city: e))
          .toList(),
    ));
  }
}
