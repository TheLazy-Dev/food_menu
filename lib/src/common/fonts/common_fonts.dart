import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonFonts {
  static TextStyle mainScreenOptionSelected = GoogleFonts.poppins(
      fontSize: 40.sp,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600);
  static TextStyle mainScreenOptionUnselected = GoogleFonts.poppins(
      fontSize: 40.sp, color: Colors.grey, fontWeight: FontWeight.w600);
  static TextStyle listTilePrice = GoogleFonts.robotoMono(
      fontSize: 16.sp, color: Colors.green, fontWeight: FontWeight.w500);
}
