import 'package:flutter/material.dart';

class CurLocWidget extends StatelessWidget {
  final Function onSelect;

  CurLocWidget({@required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onSelect,
        child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            padding: EdgeInsets.all(17.0),
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFFF7B73B),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black.withOpacity(0.15),
              //       blurRadius: 10.0,
              //       offset: Offset(0.0, 5.0))
              // ],
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Current location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  )
                ])));
  }
}
