import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

final ThemeData hrTheme = _buildHRTheme();

ThemeData _buildHRTheme() {
  return ThemeData(
    brightness: Brightness.light,
    splashColor: Color(0xFF009AFF),
    fontFamily: ArabicFonts.Cairo,
    textSelectionColor: Colors.lightBlueAccent,
    primaryColor: Color(0xFF00C2E7),
  );
}
