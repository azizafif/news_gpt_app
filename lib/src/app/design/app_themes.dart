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
    scaffoldBackgroundColor: Colors.blueGrey,

    // primaryColor: AppColors.primaryColor,
    // splashColor: AppColors.splashColor,
    // highlightColor: Colors.transparent,
    // errorColor: AppColors.errorColor,
    // hoverColor: AppColors.successColor,
    // dividerColor: AppColors.dividerColor,
    // dialogBackgroundColor: AppColors.scaffoldColor,
    cardColor: AppColors.secondaryColor,
    // hintColor: AppColors.hintColor,
    // shadowColor: AppColors.shadowColor,
    // secondaryHeaderColor: AppColors.secondaryColor,
    // focusColor: AppColors.focusColor,
    // canvasColor: AppColors.scaffoldColor,

    //? Text
    textTheme: const TextTheme(),
    //? App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      // foregroundColor: AppColors.appBarForegroundColor,
      elevation: AppValues.appBarButtonsElevation,
      toolbarHeight: AppValues.appBarHeight,
      shadowColor: AppColors.shadowColor,
      centerTitle: true,
      // titleTextStyle: AppStyles.appBarTitle,
    ),

    //? Inputs
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(left: AppValues.inputLeftContentPadding),
      errorMaxLines: 3,
      prefixIconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.disabledColor,
          width: AppValues.textFieldBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppValues.textFieldRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.dividerColor,
          width: AppValues.textFieldBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppValues.textFieldRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: AppValues.textFieldBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppValues.textFieldRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: AppValues.textFieldBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppValues.textFieldRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: AppValues.textFieldBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppValues.textFieldRadius),
      ),
    ),

    //? Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.errorColor,
    ),

    //? Card
    cardTheme: const CardTheme(
      color: AppColors.secondaryColor,
      shadowColor: AppColors.shadowColor,
      elevation: AppValues.cardElevation,
      margin: EdgeInsets.symmetric(horizontal: AppValues.cardElevation),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppValues.cardRadius)),
      ),
    ),

    //? Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(AppColors.splashColor),
        shadowColor: MaterialStateProperty.all(AppColors.shadowColor),
        elevation: MaterialStateProperty.all(AppValues.elevatedButtonElevation),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppValues.elevatedButtonRadius)))),
        // textStyle: MaterialStateProperty.all(AppStyles.textButtonTitleTextStyle),
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(AppValues.elevatedButtonHeight)),
      ),
    ),

    //? Text Button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        overlayColor: MaterialStateProperty.all(AppColors.overlayColor),
        shadowColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppValues.textButtonRadius)))),
        // textStyle: MaterialStateProperty.all(AppStyles.textButtonTitleTextStyle),
      ),
    ),

    //? List Tile
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.primaryColor,
      textColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      style: ListTileStyle.drawer,
      enableFeedback: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppValues.listTileRadius)),
      ),
      tileColor: Colors.transparent,
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
