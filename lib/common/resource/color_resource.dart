import 'package:flutter/material.dart';

class ColorResource {
  // color default của chữ
  static const Color primary = Color(0xff4A638C);

  // color  appbar, button, effect của button mặc định
  static const MaterialColor primarySwatch = MaterialColor(0xff4A638C, {
    50: Color(0xffffffff),
    100: Color(0xffeef1f6),
    200: Color(0xffdee4ed),
    300: Color(0xffdee4ed),
    400: Color(0xffbcc8dc),
    500: Color(0xffbcc8dc),
    600: Color(0xff9badca),
    700: Color(0xff8a9fc1),
    800: Color(0xff7992b9),
    900: Color(0xff6984b0)
  });

  // color effect của Inkwell
  static Color colorSplash = primarySwatch.withAlpha(100);

  // color effect background của Inkwell
  static Color colorHighLight = primarySwatch.withAlpha(50);

  static const Color colorHintText = Color(0xffa8a8a8);
  static const Color textColor = Color(0xff213659);
  static const Color divider = Colors.black12;
}
