import 'package:flutter/material.dart';

import './tab_item.dart';
import '../../../screens/weather_detail/screen.dart';

class TabListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink,
        width: double.infinity,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TabItemWidget(
                title: "Today",
                isFocus: true,
              ),
              TabItemWidget(
                title: "Next 5 Days",
                onChangeTab: () {
                  Navigator.of(context)
                      .pushNamed(WeatherDetailScreen.routeName);
                },
                isFocus: false,
              ),
            ]));
  }
}
