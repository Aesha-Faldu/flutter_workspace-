import 'package:flutter/material.dart';
import 'package:module5/Module_5/appColors.dart';

class CustomStyle {
  static AppStyle(
      {double fontSize = 16,
      Color color = primeColor,
      FontWeight fontWeight = FontWeight.w600}) {
    TextStyle textStyle =
        TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
    return textStyle;
  }
}
