import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../providers/cities.dart';
import '../../../providers/weather.dart';

class CarouselItemWidget extends StatelessWidget {
  final City city;

  CarouselItemWidget({@required this.city});

  @override
  Widget build(BuildContext context) {
    final weatherInfo = Provider.of<CurrentWeather>(context);
    String dayDate = '';
    if (weatherInfo.currentWeather != null) {
      dayDate = DateFormat('EEEE')
              .format(weatherInfo.currentWeather.dateTime)
              .toString() +
          ', ' +
          DateFormat('yMMMd')
              .format(weatherInfo.currentWeather.dateTime)
              .toString();
    }
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
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                padding: EdgeInsets.all(12.0),
                child: weatherInfo.currentWeather == null
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text(
                              city.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            dayDate == ''
                                ? Container()
                                : Text(
                                    dayDate,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '${weatherInfo.currentWeather?.temperature?.toStringAsFixed(0)}°',
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
                              weatherInfo.currentWeather?.description
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ])),
          ),
        ],
      ),
    );
  }
}
