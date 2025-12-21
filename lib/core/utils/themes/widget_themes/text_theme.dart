import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';

/* -- Light & Dark Text Themes -- */
///This class defines the text themes for the app using the Poppins font via GoogleFonts, with two separate versions: one for the light theme and one for the dark theme.
class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: tDarkColor
    ),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: tDarkColor
    ),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        color: tDarkColor
    ),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: tDarkColor
    ),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        color: tDarkColor
    ),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: tDarkColor
    ),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0,
        color: tDarkColor
    ),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0,
        color: tDarkColor.withValues(alpha: 0.8),
    ),
  );

  /* -- Dark Text Theme -- */
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: tWhiteColor
    ),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: tWhiteColor
    ),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        color: tWhiteColor
    ),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: tWhiteColor
    ),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        color: tWhiteColor
    ),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: tWhiteColor
    ),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0,
        color: tWhiteColor
    ),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0,
        color: tWhiteColor.withValues(alpha: 0.8),
    ),
  );
}
