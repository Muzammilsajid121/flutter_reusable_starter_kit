import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';
class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  // Light text field theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    fillColor: TColors.widgetbgpurewhite,
    prefixIconColor: TColors.grey,
    suffixIconColor: TColors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 16, color: TColors.greyWidgetbg.withOpacity(0.4), fontFamily: 'PlusJakartaSans'),
    hintStyle: TextStyle().copyWith(fontSize: 14, color: TColors.greyWidgetbg.withOpacity(0.4), fontFamily: 'PlusJakartaSans'),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(color: TColors.greyWidgetbg.withOpacity(0.8), fontFamily: 'PlusJakartaSans'),

    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1, color: TColors.transparent),
    ),

    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1, color: TColors.transparent),
    ),

    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: TColors.green,
      ), // Focus border color
    ),

    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: TColors.errorRed,
      ), // Error border color
    ),

    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: TColors.errorRed),
    ),
  );

  // Dark text field theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.grey,
    suffixIconColor: TColors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14, color: TColors.white),
    hintStyle: TextStyle().copyWith(fontSize: 14, color: TColors.white),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(
      color: TColors.white.withOpacity(0.8),
    ),

    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: TColors.grey),
    ),

    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: TColors.grey),
    ),

    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: TColors.white),
    ),

    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: TColors.errorRed,
      ), // Error border color
    ),

    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: TColors.errorRed),
    ),
  );
}







// import 'package:flutter/material.dart';

// class TTextFormFieldTheme {
//   TTextFormFieldTheme._();


//   //Light text field theme
//   static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(

//     errorMaxLines: 3,
//     prefixIconColor: Colors.grey,
//     suffixIconColor: Colors.grey,
//     labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
//     hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
//     errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
//     floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),

//     border: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.grey),
//     ),

//     enabledBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.grey),
//     ),

//     focusedBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.black),
//     ),

//     errorBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.red),
//     ),

//     focusedErrorBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 2, color: Colors.orange),
//     ),
//   );


//   //Dark text field theme
//   static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(

//     errorMaxLines: 3,
//     prefixIconColor: Colors.grey,
//     suffixIconColor: Colors.grey,
//     labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
//     hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
//     errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
//     floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),

//     border: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.grey),
//     ),

//     enabledBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.grey),
//     ),

//     focusedBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.white),
//     ),

//     errorBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 1, color: Colors.red),
//     ),

//     focusedErrorBorder: const OutlineInputBorder().copyWith( borderRadius: BorderRadius.circular(14),
//       borderSide: const BorderSide(width: 2, color: Colors.orange),
//     ),

//   );





// }