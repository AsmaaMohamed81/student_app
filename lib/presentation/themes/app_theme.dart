import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData() {
  return ThemeData(
      primaryColor: mainAppColor,
      hintColor: hintColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffFFFFFF),
      fontFamily: GoogleFonts.tajawal().fontFamily,
      textTheme: TextTheme(
        // app bar title
        headline1:  TextStyle(
            color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w700),
            
        button: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17.sp),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: mainAppColor));
}
