import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/application/resources/app_color.dart';

class AppTheme {
  static var appTheme = ThemeData(
    backgroundColor: onPrimaryColor,
    primaryColor: primary400,
    errorColor: errorColor,
    disabledColor: disabledColor,
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: onBackgroundColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 1.25,
        fontWeight: FontWeight.w600,
      ),
      caption: TextStyle(
        color: gray900,
        fontSize: 10,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
      ),
      overline: TextStyle(
        color: onBackgroundColor,
        fontSize: 10,
        letterSpacing: 1.5,
      ),
      bodyText1: TextStyle(
        color: onBackgroundColor,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.15,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        color: onBackgroundColor,
        fontWeight: FontWeight.bold,
      ),
    headline4: TextStyle(
        fontSize: 16,
        color: onBackgroundColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}


String getFontFamily() {
  return GoogleFonts.poppins().fontFamily!;
}