import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/argument/add_city_argument.dart';
import 'package:flutter_weather_app/core/enum/add_city_view_state.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/navigator/navigation_service.dart';
import 'package:flutter_weather_app/core/viewmodel/add_city_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../base_view.dart';

class AddCityScreen extends StatelessWidget {
  final AddCityArgument arguments;
  AddCityScreen({@required this.arguments, Key key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return BaseView<AddCityViewModel>(
        onModelReady: (viewModel) async {
          viewModel.homeViewModel = arguments.homeViewModel;
          await viewModel.getAvailableCities();
        },
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text('Add City'),
              ),
              body: ListView(
                children: [
                  _buildCurrentLocation(context: context, viewModel: viewModel),
                  Selector<AddCityViewModel, AddCityViewState>(
                    selector: (context, viewModel) =>
                        viewModel.addCityViewState,
                    builder: (context, viewState, child) => viewState ==
                            AddCityViewState.busy
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: CircularProgressIndicator(),
                          ))
                        : Column(
                            children: List.generate(
                                viewModel.availableCities.length ?? 0,
                                (index) => _buildCityItem(
                                      viewModel: viewModel,
                                      city: viewModel.availableCities[index],
                                    ))),
                  )
                ],
              ),
            ));
  }

  Widget _buildCurrentLocation(
      {BuildContext context, AddCityViewModel viewModel}) {
    return GestureDetector(
        onTap: () async {
          await viewModel.addSavedCurrentCity();
          if (viewModel.addCityViewState == AddCityViewState.error) {
            handleError(context: context);
          }
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            padding: EdgeInsets.all(17.0),
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFFF7B73B),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Current location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  )
                ])));
  }

  Widget _buildCityItem({AddCityViewModel viewModel, City city}) {
    return GestureDetector(
        onTap: () {
          viewModel.addSavedCity(city);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding: EdgeInsets.all(17.0),
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                image: AssetImage('assets/images/box_city.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(city?.name ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    city?.state ?? '',
                    style: TextStyle(fontSize: 16.0),
                  )
                ])));
  }

  void handleError({BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
              'An error occured while getting your current location. Please check your settings.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                openLocationSettings();
                _navigationService.pop();
              },
              child: Text('Ok'),
            ),
            FlatButton(
              onPressed: () async {
                _navigationService.pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
