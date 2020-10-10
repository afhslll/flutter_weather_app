import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/viewmodel/weather_detail_view_model.dart';
import 'package:flutter_weather_app/ui/view/base_view.dart';
import 'package:flutter_weather_app/ui/widget/weather_list.dart';

class WeatherDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherDetailViewModel>(
      builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: Text('Next 5 Days'),
          ),
          body: ListView.builder(
              itemCount: 5, itemBuilder: (ctx, i) => _buildWeatherDay())),
    );
  }

  Widget _buildWeatherDay() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'day',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          onTap: () {},
          trailing: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ),
        WeatherList(
          weathers: const [],
        ),
      ],
    );
  }
}
