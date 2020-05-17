import 'package:flutter/material.dart';

import '../../../widgets/weather_list.dart';
import '../../../providers/weather.dart';

class DayItemWidget extends StatefulWidget {
  final String day;
  final List<Weather> weathers;

  DayItemWidget({@required this.day, @required this.weathers});

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
          title: Text(widget.day),
          onTap: () {
            setState(() {
              _isFocus = !_isFocus;
            });
          },
          trailing: Icon(Icons.arrow_right),
        ),
        _isFocus ? WeatherListWidget(widget.weathers) : Container(),
      ],
    );
  }
}
