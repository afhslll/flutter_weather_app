import 'package:flutter/material.dart';
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InfoItem(
                title: 'Sunrise',
                icon: Icon(
                  Icons.brightness_low,
                  color: Color(0xFFEC6E4C),
                ),
                value: '11'),
            InfoItem(
                title: 'Sunset',
                icon: Icon(
                  Icons.brightness_medium,
                  color: Color(0xFFEC6E4C),
                ),
                value: '11'),
            InfoItem(
                title: 'Humidity',
                icon: Icon(
                  Icons.opacity,
                  color: Color(0xFFEC6E4C),
                ),
                value: '11%'),
            InfoItem(
                title: 'Wind',
                icon: Icon(
                  Icons.cloud_queue,
                  color: Color(0xFFEC6E4C),
                ),
                value: '11 m/s'),
          ],
        ));
  }
}
