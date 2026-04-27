import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';

class TIconButtonTheme {
  TIconButtonTheme._();

  // FOR LIGHT THEME
  static final lightTIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(TColors.black), // Icon color
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      overlayColor: WidgetStateProperty.all(
        TColors.primaryYellow.withOpacity(0.1),
      ), // Ripple effect
    ),
  );

  // FOR DARK THEME
  static final darkTIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(TColors.white), // Icon color
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      overlayColor: WidgetStateProperty.all(
        TColors.green.withOpacity(0.1),
      ), // Ripple effect
    ),
  );
}
