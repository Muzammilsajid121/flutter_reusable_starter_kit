import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  // FOR LIGHT THEME
  static CheckboxThemeData lightCheckTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.white;
      } else {
        return TColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.green;
      } else {
        return Colors.transparent;
      }
    }),
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(color: TColors.green);
      } else {
        return const BorderSide(color: TColors.grey);
      }
    }),
  );

  // FOR DARK THEME
  static CheckboxThemeData darkCheckTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.white;
      } else {
        return TColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.green;
      } else {
        return Colors.transparent;
      }
    }),
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(color: TColors.green);
      } else {
        return const BorderSide(color: TColors.grey);
      }
    }),
  );
}
