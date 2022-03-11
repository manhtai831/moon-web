import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/export_this.dart';

ThemeData appStyle = ThemeManager.getInstance().getTheme();

class ThemeManager {
  ThemeData? _themeData = ThemeData(
    brightness: Brightness.light,
    // màu chữ mặc định
    primaryColor: ColorResource.primary,
    primaryColorDark: ColorResource.primary,
    primaryColorLight: ColorResource.primary,
    cardColor: Colors.white,
    indicatorColor: ColorResource.primary,
    splashColor: ColorResource.colorSplash,
    highlightColor: ColorResource.colorHighLight,
    hintColor: ColorResource.colorHintText,
    // màu background
    //canvasColor: Colors.yellow,
    dividerColor: Colors.blueGrey,
    toggleableActiveColor: Colors.red,
    // màu appbar, button, effect mặc định
    primarySwatch: ColorResource.primarySwatch,
    fontFamily: fontFamily,
    textTheme: const TextTheme(
      headline6:
          TextStyle(fontWeight: FontWeight.w900, color: ColorResource.textColor, fontSize: 14),
      headline5:
          TextStyle(fontWeight: FontWeight.w900, color: ColorResource.textColor, fontSize: 18),
      headline4:
          TextStyle(fontWeight: FontWeight.w900, color: ColorResource.textColor, fontSize: 22),
      headline3:
          TextStyle(fontWeight: FontWeight.w900, color: ColorResource.textColor, fontSize: 26),
      headline2:
          TextStyle(fontWeight: FontWeight.w900, color: ColorResource.textColor, fontSize: 30),
      headline1:
          TextStyle(fontWeight: FontWeight.w900, color: ColorResource.textColor, fontSize: 34),
      bodyText1:
          TextStyle(fontWeight: FontWeight.w400, color: ColorResource.textColor, fontSize: 14),
      bodyText2:
          TextStyle(fontWeight: FontWeight.w400, color: ColorResource.textColor, fontSize: 16),
    ),
  );

  static const String fontFamily = 'LexendExa';

  static ThemeManager? _themeManager;

  static ThemeManager getInstance() {
    return _themeManager ??= ThemeManager();
  }

  ThemeData getTheme() {
    return _themeData!;
  }

  setTheme({ThemeData? customTheme}) {
    _themeData = customTheme;
  }
}
