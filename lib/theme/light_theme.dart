
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  // scaffoldBackgroundColor: const Color.fromARGB(255, 5, 19, 6).withOpacity(0.8),
  // scaffoldBackgroundColor: const Color.fromARGB(255, 5, 19, 6).withOpacity(1),
  cardColor: Colors.grey[300],
  focusColor: Colors.grey[500],
  hintColor: Colors.black12,
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w800
    ),
    labelSmall: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
      letterSpacing: 0.9
    ),
    labelMedium:  GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
      letterSpacing: 0.9
    ),
    labelLarge: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 36,
      fontWeight: FontWeight.w800,
      decoration: TextDecoration.none,
      letterSpacing: 0.9
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: const Color(0xFF5EE61F),
    focusColor: const Color(0xFF5EE61F)
  )
);