import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  final String title;
  final Function onChangeTab;
  final bool isFocus;

  TabItemWidget({this.title, this.onChangeTab, this.isFocus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onChangeTab,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight:
                            isFocus ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16.0),
                  ),
                  !isFocus
                      ? SizedBox(
                          width: 8.0,
                        )
                      : Container(),
                  !isFocus
                      ? Icon(
                          Icons.trending_flat,
                          size: 20,
                        )
                      : Container()
                ],
              ),
              isFocus
                  ? Icon(
                      Icons.fiber_manual_record,
                      size: 12,
                    )
                  : Container()
            ])));
  }
}
