import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';

class TElevatedButtonTheme {
  // To avoid creating instance
  TElevatedButtonTheme._();

  // FOR LIGHT THEME
  static final ligthElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.transparent, // Text color
      backgroundColor: TColors.primaryYellow, // Button bg color
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textStyle: const TextStyle(
        fontSize: 14,
        color: TColors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'PlusJakartaSans',
      ),
    ),
  );

  // FOR DARK THEME
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white, // Text color
      backgroundColor: TColors.green, // Button bg color
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
