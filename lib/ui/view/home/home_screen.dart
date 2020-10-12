import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/argument/add_city_argument.dart';
import 'package:flutter_weather_app/core/argument/weather_detail_argument.dart';
import 'package:flutter_weather_app/core/enum/view_state.dart';
import 'package:flutter_weather_app/core/model/weather.dart';
import 'package:flutter_weather_app/core/router/router.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/core/viewmodel/home_view_model.dart';
import 'package:flutter_weather_app/ui/widget/weather_list.dart';
import 'package:provider/provider.dart';
import '../base_view.dart';
import 'city_list.dart';
import 'info_list.dart';
import 'tab_list.dart';

class HomeScreen extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.setupPage();
        if (viewModel.viewState == ViewState.error) {
          handleError(context: context, viewModel: viewModel);
        }
      },
      builder: (context, viewModel, child) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  _navigationService.navigateTo(
                    NavigationRouter.addCityRoute,
                    arguments: AddCityArgument(
                      homeViewModel: viewModel,
                    ),
                  );
                },
                iconSize: 30.0,
              ),
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: _buildContent(viewModel: viewModel))),
    );
  }

  Widget _buildContent({HomeViewModel viewModel}) {
    return SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            CityList(
              homeViewModel: viewModel,
            ),
            InfoList(),
            TabList(
              onTap: () {
                _navigationService.navigateTo(
                  NavigationRouter.weatherDetailRoute,
                  arguments:
                      WeatherDetailArgument(dayForecast: viewModel.dayForecast),
                );
              },
            ),
            Selector<HomeViewModel, List<Weather>>(
              selector: (context, viewModel) => viewModel.currentForecast,
              builder: (context, forecast, child) => WeatherList(
                weathers: forecast ?? [],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }

  void handleError({BuildContext context, HomeViewModel viewModel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
              'An error occured while retrieving current weather. Please try again.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () async {
                await viewModel.setupPage();
                _navigationService.pop();
                if (viewModel.viewState == ViewState.error) {
                  handleError(context: context, viewModel: viewModel);
                }
              },
              child: Text('Retry'),
            ),
          ],
        );
      },
    );
  }
}
