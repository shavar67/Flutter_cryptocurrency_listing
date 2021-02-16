import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadLines6 =>
      _poppinsTextTheme.headline6.copyWith(fontSize: 20, color: Colors.white);
  static getTextTheme() => TextTheme(headline6: _whiteHeadLines6);
}
