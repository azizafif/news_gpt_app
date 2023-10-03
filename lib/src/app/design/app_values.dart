import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppValues {
  AppValues._();

  //? Scaffold
  static const double bodyTopPadding = 50;
  static const double bodyBottomPadding = 50;
  static const double bodyMinSymetricHorizontalPadding = 40;
  static const double bodyMinSymetricVerticalPadding = 100;

  //? Inputs
  static const double inputBorderWidth = 0.8;
  static const double inputBorderRadius = defaultRadius;
  static const int inputMaxLength = 50;
  static const int passwordInputMaxLength = 12;

  //? Floating Action Buttons
  static const double floatingActionButtonRadius = defaultRadius;
  static const double floatingActionButtonIconSize = 22;

  //? Text button
  static const double textButtonElevation = defaultElevation;
  static const double textButtonRadius = defaultRadius;
  static const double textButtonHeight = 52;

  //? Link button
  static const double linkButtonHeight = 25;

  //? Inputs
  static const double textFieldRadius = defaultRadius;
  static const double textFieldHeight = 43;
  static const double textFieldHorizontalContentPadding = 10;
  static const double textFieldMinVerticalContentPadding = 6;
  static const double textFieldMaxVerticalContentPadding = 12;
  static const double searchWidgetHeight = 40;
  static const int inputsDefaultMaxLength = 50;
  static const double inputLeftContentPadding = 22;

  //? Logo
  static const double logoSize = 75;

  //? File Picking
  static const int pickedFileSizeLimit = 5;
  static const int pickedFileSizeLimitInBytes = pickedFileSizeLimit * 1024 * 1024;
  static const int pickedImageQuality = 60;
  static const List<String> pickableFilesExtensions = ['jpeg', 'jpg', 'png', 'pdf'];

  //? Api Error Widget
  static const double apiErrorWidgetImageSize = 100;

  //$ Default Radius
  static const double defaultRadius = 8;

  //$ Elevation
  static const double defaultElevation = 1;
  //& UI assertions
  static void performUserInterfaceValuesAssertions() {
    assert(
      defaultElevation <= 3,
      '\n[defaultElevation] defaultElevation must be <= 3',
    );
    assert(
      defaultRadius <= 20,
      '\n[defaultElevation] defaultRadius must be <= 20',
    );
  }
}
