import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'efficacy_usercolor.dart';

ThemeData lightTheme = ThemeData(
  //fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: AppColorLight.primary,
  backgroundColor: AppColorLight.background,
  scaffoldBackgroundColor: AppColorLight.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorLight.background,
    shadowColor: AppColorLight.background,
    foregroundColor: AppColorLight.mainText,
    elevation: 0,
  ),
  cardTheme: CardTheme(
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    shadowColor: AppColorLight.cardShadow,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  iconTheme: IconThemeData(color: AppColorLight.subtitleText),
  primaryIconTheme: IconThemeData(color: AppColorLight.mainText),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 2,
    backgroundColor: AppColorLight.background,
    selectedItemColor: AppColorLight.secondary,
    unselectedItemColor: const Color(0xFF7D7D7D).withOpacity(0.5),
  ),
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
