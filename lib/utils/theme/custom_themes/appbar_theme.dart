
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';
//if your appbar action side has no space use sizedbox in action of 16 width
class TAppBarTheme {
  TAppBarTheme._();

  // FOR LIGHT THEME
  static const lightAppBarTheme = AppBarTheme(
    surfaceTintColor: TColors.widgetbgpurewhite,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: false,
    backgroundColor: TColors.widgetbgpurewhite, // Light theme app bar background
    iconTheme: IconThemeData(color: TColors.black, size: 24),
    actionsIconTheme: IconThemeData(color: TColors.black, size: 24),
    titleTextStyle: TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      color: TColors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );

  // FOR DARK THEME
  static const darkAppBarTheme = AppBarTheme(
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: false,
    backgroundColor: TColors.grey, // Dark theme app bar background
    iconTheme: IconThemeData(color: TColors.white, size: 24),
    actionsIconTheme: IconThemeData(color: TColors.white, size: 24),
    titleTextStyle: TextStyle(
      fontFamily: 'Lexend',
      color: TColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w900,
    ),
  );
}

