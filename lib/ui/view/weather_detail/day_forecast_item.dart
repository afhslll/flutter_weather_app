import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/widget/weather_list.dart';
import 'package:flutter_weather_app/core/model/weather.dart';

class DayForecastItem extends StatefulWidget {
  final bool isFocus;
  final String day;
  final List<Weather> weathers;

  const DayForecastItem(
      {@required this.day, @required this.weathers, this.isFocus});

  @override
  _DayForecastItemState createState() => _DayForecastItemState();
}

class _DayForecastItemState extends State<DayForecastItem> {
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
        _isFocus ? WeatherList(weathers: widget.weathers) : Container(),
      ],
    );
  }
}
