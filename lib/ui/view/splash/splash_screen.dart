import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/view/base_view.dart';
import 'package:flutter_weather_app/core/viewmodel/startup_view_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (viewModel) {
        viewModel.handleStartupLogic();
      },
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Weather App by Afifah'),
        ),
      ),
    );
  }
}
