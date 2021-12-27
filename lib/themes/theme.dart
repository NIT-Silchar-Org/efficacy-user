import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'efficacy_usercolor.dart';

ThemeData lightTheme = ThemeData(
  //fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: AppColorLight.primary,
  backgroundColor: AppColorLight.background,
  scaffoldBackgroundColor: AppColorLight.background,
  textTheme: TextTheme(
    headline1: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: AppColorLight.mainText,
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
    // headline2: TextStyle(
    //   color: AppColorLight.mainText,
    //   fontSize: 17.0,
    //   fontWeight: FontWeight.w500,
    //   letterSpacing: 0.5,
    // ),
    headline3: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: AppColorLight.titleText,
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
    ),
    // headline4: TextStyle(
    //   color: AppColor.mainText,
    //   fontSize: 15.0,
    //   fontWeight: FontWeight.w700,
    //   letterSpacing: 0.5,
    // ),
    subtitle1: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: AppColorLight.subtitleText,
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
      ),
    ),
  ),
);
