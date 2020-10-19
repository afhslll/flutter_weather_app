import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/utils/utils.dart';
import 'package:flutter_weather_app/ui/shared/theme_color.dart';

class HomeBackgroundPainter extends StatelessWidget {
  const HomeBackgroundPainter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: CurveBackground(),
      ),
    );
  }
}

class CurveBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final heightMultiplier = getHeightMultiplier(size.height);

    final Paint paint1 = Paint()..color = ThemeColor.yellowCream;
    final height1 = (size.height / 2) + (100 * heightMultiplier);
    final Path path1 = Path();
    path1.moveTo(40, 0);
    path1.conicTo(50, height1, size.width, height1, 0.4);
    path1.lineTo(size.width, 0);
    path1.close();
    canvas.drawPath(path1, paint1);

    final Paint paint2 = Paint()..color = ThemeColor.darkBlue;
    final Path path2 = Path();
    path2.lineTo(0, (size.height / 2) + (70 * heightMultiplier));
    path2.cubicTo(90, (size.height / 2) + (70 * heightMultiplier), 90,
        (size.height / 2) - 70, size.width / 2, (size.height / 2) - 105);
    path2.cubicTo(
        (size.width / 2) + 90,
        (size.height / 2) - 130,
        size.width - 70,
        (size.height / 2) - 80,
        size.width,
        (size.height / 2) - 130);
    path2.lineTo(size.width, 0);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CurveBackground oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CurveBackground oldDelegate) => false;
}
