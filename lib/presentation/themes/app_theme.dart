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
        // app bar title in portrait mode
        headline1: TextStyle(
            color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w700),

     // app bar title in landscape mode
        headline2: TextStyle(
            color: Colors.black, fontSize: 40.sp, fontWeight: FontWeight.w700),
    

     // button in portait mode
        button: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.sp),
     

      // button in landscape
         headline3: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold)   
            
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: mainAppColor));
}
