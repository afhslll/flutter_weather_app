import 'package:flutter/material.dart';

import 'package:flutter_weather_app/core/constant/path_constant.dart';
import 'package:flutter_weather_app/core/constant/strings_constant.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Image.asset(
                  ConstantAssetsString.appIcon,
                ),
              ),
              Text(
                ConstantStrings.appName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              )
            ],
          ),
        ),
      ),
    );
  }
}
