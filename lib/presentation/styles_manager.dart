import 'package:flutter/material.dart';

TextStyle getMainTextStyle(double fontSize,
    {Color color = const Color(0xff342783)}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'Poppins',
    color: color,
  );
}

TextStyle getRegularTextStyle(double fontSize,
    {Color color = const Color(0xff342783)}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    color: color,
  );
}
