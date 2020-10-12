import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/constant/url_constant.dart';
import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter_weather_app/core/utils/utils.dart';

class WeatherList extends StatelessWidget {
  final List<Weather> weathers;
  const WeatherList({@required this.weathers});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weathers.length,
            itemBuilder: (ctx, i) => _buildWeatherItem(
                  isFirst: i == 0,
                  isLast: (i + 1) == weathers.length,
                  weather: weathers[i],
                )));
  }

  Widget _buildWeatherItem({bool isFirst, bool isLast, Weather weather}) {
    return Container(
        width: 64.0,
        margin: EdgeInsets.fromLTRB(
            isFirst ? 16.0 : 6.0, 6.0, isLast ? 16.0 : 6.0, 6.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(formatTime(weather?.dateTime)),
              SizedBox(
                height: 2.0,
              ),
              Image.network(ConstantUrl.getIconUrl(weather?.icon ?? ''),
                  height: 40, fit: BoxFit.contain),
              SizedBox(
                height: 2.0,
              ),
              Text(formatTemperature(weather?.temperature),
                  style: TextStyle(color: Colors.grey[600])),
            ]));
  }
}
