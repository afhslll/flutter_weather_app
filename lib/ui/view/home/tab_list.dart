import 'package:flutter/material.dart';
import 'tab_item.dart';

class TabList extends StatelessWidget {
  final VoidCallback onTap;
  const TabList({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TabItem(
                title: 'Today',
                isFocus: true,
              ),
              TabItem(
                title: 'Next 5 Days',
                onTap: onTap,
                isFocus: false,
              ),
            ]));
  }
}
