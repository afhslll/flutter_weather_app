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
              Text(title),
              isFocus ? Icon(Icons.fiber_manual_record) : Container()
            ])));
  }
}
