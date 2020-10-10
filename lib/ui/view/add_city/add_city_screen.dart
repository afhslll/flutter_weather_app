import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/enum/view_state.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter_weather_app/core/viewmodel/add_city_view_model.dart';
import 'package:provider/provider.dart';
import '../base_view.dart';

class AddCityScreen extends StatelessWidget {
  const AddCityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AddCityViewModel>(
        onModelReady: (viewModel) async {
          await viewModel.getAvailableCities();
        },
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text('Add City'),
              ),
              body: ListView(
                children: [
                  _buildCurrentLocation(),
                  Selector<AddCityViewModel, ViewState>(
                    selector: (context, viewModel) => viewModel.viewState,
                    builder: (context, viewState, child) =>
                        viewState == ViewState.busy
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                children: List.generate(
                                    viewModel.availableCities.length ?? 0,
                                    (index) => _buildCityItem(
                                        viewModel.availableCities[index]))),
                  )
                ],
              ),
            ));
  }

  Widget _buildCurrentLocation() {
    return GestureDetector(
        onTap: () {},
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

  Widget _buildCityItem(City city) {
    return GestureDetector(
        onTap: () {},
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
}
