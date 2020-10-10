import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter_weather_app/core/utils/utils.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'info_item.dart';

class InfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            color: Color(0xFFFCBF49)),
        margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 120,
        child: Selector<HomeViewModel, Weather>(
          selector: (context, viewModel) => viewModel.currentWeather,
          builder: (context, weather, child) => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InfoItem(
                  title: 'Sunrise',
                  icon: Icon(
                    Icons.brightness_low,
                    color: Color(0xFFEC6E4C),
                  ),
                  value: formatTime(weather?.sunrise)),
              InfoItem(
                  title: 'Sunset',
                  icon: Icon(
                    Icons.brightness_medium,
                    color: Color(0xFFEC6E4C),
                  ),
                  value: formatTime(weather?.sunset)),
              InfoItem(
                  title: 'Humidity',
                  icon: Icon(
                    Icons.opacity,
                    color: Color(0xFFEC6E4C),
                  ),
                  value: '${weather?.humidity?.toString() ?? ''} %'),
              InfoItem(
                  title: 'Wind',
                  icon: Icon(
                    Icons.cloud_queue,
                    color: Color(0xFFEC6E4C),
                  ),
                  value: '${weather?.wind?.toString() ?? ''} m/s'),
            ],
          ),
        ));
  }
}
