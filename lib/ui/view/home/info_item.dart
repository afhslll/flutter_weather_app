import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final String value;

  const InfoItem(
      {@required this.title, @required this.icon, @required this.value});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            margin: EdgeInsets.all(6.0),
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  icon,
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value,
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ])));
  }
}
