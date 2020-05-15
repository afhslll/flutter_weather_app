import 'package:flutter/material.dart';

class InfoItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Icon(Icons.cloud),
      Text('Sunrise'),
      Text('06:30')
    ]));
  }
}
