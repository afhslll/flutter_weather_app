import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import '../base_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Navigator.of(context).pushNamed(AddCityScreen.routeName);
                },
                iconSize: 30.0,
              ),
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                  top: false,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      CityListWidget(),
                      InfoListWidget(),
                      TabListWidget(),
                      Consumer<Forecast>(
                        builder: (ctx, forecastData, child) =>
                            forecastData.forecast.isEmpty
                                ? Container()
                                : WeatherListWidget(
                                    forecastData.forecast.values.first),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )))),
    );
  }
}
