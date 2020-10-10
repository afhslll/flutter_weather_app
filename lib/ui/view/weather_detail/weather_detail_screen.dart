import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/argument/weather_detail_argument.dart';
// import 'package:flutter_weather_app/core/viewmodel/weather_detail_view_model.dart';
// import 'package:flutter_weather_app/ui/view/base_view.dart';
import 'day_forecast_item.dart';

class WeatherDetailScreen extends StatelessWidget {
  final WeatherDetailArgument arguments;
  const WeatherDetailScreen({@required this.arguments});
  @override
  Widget build(BuildContext context) {
    final dayForecast = arguments?.dayForecast;
    // print(dayForecast);
    return Scaffold(
      appBar: AppBar(
        title: Text('Next 5 Days'),
      ),
      body: ListView.builder(
        itemCount: dayForecast?.length == null ? 0 : dayForecast.length - 1,
        itemBuilder: (ctx, i) => DayForecastItem(
            isFocus: i == 0 ? true : false,
            day: dayForecast.keys.elementAt(i + 1),
            weathers: dayForecast.values.elementAt(i + 1)),
      ),
    );
  }
}
