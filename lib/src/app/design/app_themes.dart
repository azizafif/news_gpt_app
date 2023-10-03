import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class AppThemes {
  AppThemes._();

  static ThemeMode themeMode = ThemeMode.light;

  //* Helpers
  static bool get isLight => themeMode == ThemeMode.light;
  static String get describingTitle => isLight ? 'Light' : 'Dark';
  static IconData get describingIcon => isLight ? CupertinoIcons.sun_haze : CupertinoIcons.moon_stars;

  //? LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    //? Colors
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,

    //? Text
    textTheme: const TextTheme(),
    //? App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      // foregroundColor: AppColors.appBarForegroundColor,

      shadowColor: AppColors.shadowColor,
      centerTitle: true,
      // titleTextStyle: AppStyles.appBarTitle,
    ),

    //? Inputs
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(left: AppValues.inputLeftContentPadding),
      errorMaxLines: 3,
      prefixIconColor: Colors.white,
      suffixIconColor: Colors.white,
      border: InputBorder.none,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.textFieldRadius),
      ),
    ),

    //? Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.errorColor,
    ),

    //? Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.warningColor,
      color: AppColors.primaryColor,
      linearTrackColor: AppColors.warningColor,
    ),

    //? Primary Icon
    primaryIconTheme: const IconThemeData(color: AppColors.primaryColor),

    //? Icon
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
  );
}
