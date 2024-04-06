import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle({
  double fontSize = 14,
  Color color = kGray,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    GoogleFonts.poppins(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
    );
