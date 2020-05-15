import 'package:flutter/material.dart';

import './info_item.dart';

class ListInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        color: Colors.green,
        width: double.infinity,
        height: screenSize.height / 6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InfoItemWidget(),
            InfoItemWidget(),
            InfoItemWidget(),
            InfoItemWidget(),
          ],
        ));
  }
}
