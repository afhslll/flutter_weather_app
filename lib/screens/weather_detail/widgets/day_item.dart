import 'package:flutter/material.dart';

import '../../../widgets/weather_list.dart';
import '../../../providers/weather.dart';

class DayItemWidget extends StatefulWidget {
  final bool isFocus;
  final String day;
  final List<Weather> weathers;

  DayItemWidget({@required this.day, @required this.weathers, this.isFocus});

  @override
  _DayItemWidgetState createState() => _DayItemWidgetState();
}

class _DayItemWidgetState extends State<DayItemWidget> {
  var _isFocus = false;

  @override
  void initState() {
    _isFocus = widget.isFocus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            widget.day,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            setState(() {
              _isFocus = !_isFocus;
            });
          },
          trailing: Icon(
            _isFocus ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            color: Colors.black,
          ),
        ),
        _isFocus ? WeatherListWidget(widget.weathers) : Container(),
      ],
    );
  }
}
