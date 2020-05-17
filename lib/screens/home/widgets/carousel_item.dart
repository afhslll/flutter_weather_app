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
      color: Colors.blue,
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              // Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Column(children: <Widget>[
                      Text(
                        city.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      dayDate == ''
                          ? Container()
                          : Text(
                              dayDate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      Text(
                        '${weatherInfo.currentWeather?.temperature.toString()}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        weatherInfo.currentWeather?.description.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
              ),
            ],
          )),
    );
  }
}
