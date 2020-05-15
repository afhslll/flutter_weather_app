import 'package:flutter/material.dart';

class CityItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        height: 80,
        color: Colors.teal,
        child: Column(
            children: <Widget>[Text('George Town'), Text('Pulau Pinang')]));
  }
}
