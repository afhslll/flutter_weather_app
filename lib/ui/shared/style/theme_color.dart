import 'package:flutter/material.dart';

class ThemeColor {
  ThemeColor._();

  static const MaterialColor engine = MaterialColor(0xFF1E88E5, <int, Color>{
    300: Color(0xFF64B5F6),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1)
  });

  static const List<Color> fusion01 = [Color(0xFF64B5F6), engine];
  static const List<Color> fusion02 = [Color(0xFFEF820D), Color(0xFFF05E23)];

  static const brand01 = Color(0xFFFFCC32);
  static const Color brand02 = Color(0xFFFEBF00);
  static const Color brand03 = Color(0xFF2D7BB8);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
