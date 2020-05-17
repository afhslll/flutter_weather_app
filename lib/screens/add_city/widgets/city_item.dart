import 'package:flutter/material.dart';

class CityItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onSelect;

  CityItemWidget(
      {@required this.title, @required this.subtitle, @required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onSelect,
        child: Container(
            margin: EdgeInsets.all(8),
            width: double.infinity,
            height: 80,
            color: Colors.teal,
            child: Column(children: <Widget>[Text(title), Text(subtitle)])));
  }
}
