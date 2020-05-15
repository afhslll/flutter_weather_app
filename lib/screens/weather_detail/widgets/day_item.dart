import 'package:flutter/material.dart';

import '../../../widgets/list_weather.dart';

class DayItemWidget extends StatefulWidget {
  @override
  _DayItemWidgetState createState() => _DayItemWidgetState();
}

class _DayItemWidgetState extends State<DayItemWidget> {
  var _isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Monday'),
          onTap: () {
            setState(() {
              _isFocus = !_isFocus;
            });
          },
          trailing: Icon(Icons.arrow_right),
        ),
        _isFocus ? ListWeatherWidget() : Container(),
      ],
    );
  }
}
