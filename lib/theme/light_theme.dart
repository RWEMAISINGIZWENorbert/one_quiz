
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.grey[300],
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
  )
);