import 'package:flutter/material.dart';
// import 'package:flutter_weather_app/core/model/weather.dart';

class WeatherList extends StatelessWidget {
  // final List<Weather> weathers;

  // const WeatherList(this.weathers);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (ctx, i) => _buildWeatherItem(
                  isFirst: i == 0,
                  isLast: (i + 1) == 10,
                  // weather: weathers[i],
                )));
  }

  Widget _buildWeatherItem({bool isFirst, bool isLast}) {
    return Container(
        width: 64.0,
        margin: EdgeInsets.fromLTRB(
            isFirst ? 16.0 : 6.0, 6.0, isLast ? 16.0 : 6.0, 6.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('11:11'),
              SizedBox(
                height: 2.0,
              ),
              Image.network('http://openweathermap.org/img/wn/11n@2x.png',
                  height: 40, fit: BoxFit.contain),
              SizedBox(
                height: 2.0,
              ),
              Text('11°', style: TextStyle(color: Colors.grey[600])),
            ]));
  }
}
