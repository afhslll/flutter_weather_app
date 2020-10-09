import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          child: CarouselSlider(
              options: CarouselOptions(
                  initialPage: 0,
                  aspectRatio: 1.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: false,
                  onPageChanged: (index, reason) {}),
              items: [
                _buildCarouselItem(),
                _buildCarouselItem(),
                _buildCarouselItem(),
              ])),
    );
  }

  Widget _buildCarouselItem() {
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
      child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
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
                      'city.name',
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
                  'dayDate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '111°',
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
                  'desc',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ])),
    );
  }
}
