import 'package:flutter/material.dart';
import 'efficacy_usercolor.dart';

ThemeData lightTheme = ThemeData(
  //fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: AppColorLight.primary,
  backgroundColor: AppColorLight.background,
  scaffoldBackgroundColor: AppColorLight.background,
  hintColor: AppColorLight.hintcolor,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: AppColorLight.efficacytitle,
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      color: AppColorLight.inputtextcolor,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
    ),
  ),
);
