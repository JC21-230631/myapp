
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.notoSansJpTextTheme(
        ThemeData.light().textTheme,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      textTheme: GoogleFonts.notoSansJpTextTheme(
        ThemeData.dark().textTheme,
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal, brightness: Brightness.dark),
    );
  }
}
