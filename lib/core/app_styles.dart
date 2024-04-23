// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle loginTiltle =TextStyle(
    color: AppColors.customBlackColor,
    fontWeight: FontWeight.bold,
    fontSize: 50.sp,
    fontFamily: "Segoe UI",
  );
  static TextStyle loginSubmitButtonText =TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    fontFamily: "Segoe UI",
    color: Colors.white,
  );

  static TextStyle homeScreenTitle = GoogleFonts.balooThambi2(
    color: AppColors.customBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
  );


}
