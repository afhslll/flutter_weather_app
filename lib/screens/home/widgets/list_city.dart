import 'package:flutter/material.dart';

import '../../../screens/add_city/screen.dart';
import '../../../widgets/carousel.dart';

class ListCityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: screenSize.height / 2,
        color: Colors.redAccent,
        child: Stack(
          children: <Widget>[
            CarouselWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                  child: new Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddCityScreen.routeName);
                  }),
            )
          ],
        ));
  }
}
