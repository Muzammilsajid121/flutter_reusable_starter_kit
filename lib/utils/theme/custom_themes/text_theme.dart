import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // Display - Small
    displaySmall: GoogleFonts.plusJakartaSans( fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),

    // Body - Small
    bodySmall: GoogleFonts.plusJakartaSans(  fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),

    // Body - Medium
    bodyMedium: GoogleFonts.plusJakartaSans( fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),

    // Body - Large
    bodyLarge: GoogleFonts.plusJakartaSans( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),

    // Title - Small
    titleSmall: GoogleFonts.plusJakartaSans( fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),

    // Title - Medium
    titleMedium: GoogleFonts.plusJakartaSans( fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),

    // Title - Large
    titleLarge: GoogleFonts.plusJakartaSans(  fontSize: 31, fontWeight: FontWeight.bold, color: Colors.black),

    // Display - Large
    displayLarge: GoogleFonts.plusJakartaSans(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),

  
  );

  static TextTheme darkTextTheme = TextTheme(
    // Display - Small
    displaySmall: GoogleFonts.  plusJakartaSans(  fontSize: 9, fontWeight: FontWeight.w500, color: Colors.white),

    // Body - Small
    bodySmall: GoogleFonts.plusJakartaSans( fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white),

    // Body - Medium
    bodyMedium: GoogleFonts.plusJakartaSans( fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),

    // Body - Large
    bodyLarge: GoogleFonts.plusJakartaSans( fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),

    // Title - Small
    titleSmall: GoogleFonts.plusJakartaSans( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),

    // Title - Medium
    titleMedium: GoogleFonts.plusJakartaSans(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),

    // Title - Large
    titleLarge: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),


    displayLarge: GoogleFonts.plusJakartaSans(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
  );
}




