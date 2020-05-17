import 'package:flutter/material.dart';

class InfoItemWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String value;

  InfoItemWidget(
      {@required this.title, @required this.icon, @required this.value});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            child: Column(children: <Widget>[icon, Text(title), Text(value)])));
  }
}
