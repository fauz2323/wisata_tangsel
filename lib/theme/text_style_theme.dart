import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleTheme {
  static TextStyle primary = GoogleFonts.montserrat(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textWelcome = GoogleFonts.montserrat(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appbarText = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle alamatText = GoogleFonts.montserrat(
    fontSize: 15,
    color: Colors.grey,
  );

  static TextStyle textImage = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
