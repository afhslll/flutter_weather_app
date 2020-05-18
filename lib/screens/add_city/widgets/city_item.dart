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
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding: EdgeInsets.all(17.0),
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFFFCBF49),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16.0),
                  )
                ])));
  }
}
