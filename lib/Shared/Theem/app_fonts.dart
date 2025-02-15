import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp2/Shared/Theem/app_color.dart';

class AppFonts {
  static TextStyle boldPrimaryGreen = GoogleFonts.rubik(
      color: AppColors.greenColor, fontSize: 20.0, fontWeight: FontWeight.bold);

  static TextStyle normalPrimaryGreen = GoogleFonts.rubik(
      color: AppColors.greenColor,
      fontSize: 20.0,
      fontWeight: FontWeight.normal);

  static TextStyle boldPrimaryBlack = GoogleFonts.rubik(
      color: AppColors.blackColor, fontSize: 20.0, fontWeight: FontWeight.bold);
  static TextStyle normalPrimaryblack = GoogleFonts.rubik(
      color: AppColors.blackColor,
      fontSize: 16.0,
      fontWeight: FontWeight.normal);

    static TextStyle boldPrimaryDrck = GoogleFonts.rubik(
      color: AppColors.darkColor, fontSize: 20.0, fontWeight: FontWeight.bold);
  static TextStyle normalPrimaryDarck = GoogleFonts.rubik(
      color: AppColors.darkColor,
      fontSize: 16.0,
      fontWeight: FontWeight.normal);
}
