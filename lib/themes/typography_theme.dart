import 'package:billify/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyTheme {
  const TypographyTheme();

  static TextStyle body = GoogleFonts.inter(
    color: ColorTheme.black,
    fontSize: 16,
  );

  static TextStyle logo = GoogleFonts.kantumruyPro(
    fontSize: 28,
  );

  static TextStyle label = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorTheme.mainBlue,
  );

  static TextStyle switchLabel = GoogleFonts.inter(
    color: ColorTheme.mainWhite,
    fontSize: 18,
  );

  static TextStyle homeTitle = GoogleFonts.inter(
    color: ColorTheme.black,
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );

  static TextStyle homeSubtitle = homeTitle.copyWith(
    fontSize: 16,
  );
}
