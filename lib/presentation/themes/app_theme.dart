import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/utils/app_colors.dart';

ThemeData themeData() {
  return ThemeData(
      primaryColor: mainAppColor,
      hintColor: hintColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor:const  Color(0xffFFFFFF),
      fontFamily: 'IBMPlexSans',
      textTheme: TextTheme(
        // app bar style
        headline1:
          const   TextStyle(  color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400),

      
        headline2: const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w800),

        // hint style of text form
        headline3: TextStyle(
                    color: hintColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),

      // style title Text (PopularComapnies)
        headline4:const  TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.5),
        
    // style title Text (Watch All)
        headline5: TextStyle(
          color: mainAppColor,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),

        button: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17.0),

      
      ),
       textSelectionTheme: TextSelectionThemeData(cursorColor: mainAppColor));
}
