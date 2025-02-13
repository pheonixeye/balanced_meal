import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  static final primaryColor = Color(0xffF25700);
  static final enabledButtonForegroundColor = Colors.white;
  static final disabledButtonForegroundColor = Color(0xff959595);
  static final disabledButtonBackgroundColor = Color(0xffEAECF0);
  static final inputBorderColor = Color(0xffEAECF0);

  static final theme = ThemeData(
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: enabledButtonForegroundColor,
        backgroundColor: primaryColor,
        disabledBackgroundColor: disabledButtonBackgroundColor,
        disabledForegroundColor: disabledButtonForegroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 87.5,
          vertical: 18,
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: inputBorderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: inputBorderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: inputBorderColor,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
