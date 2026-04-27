import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  // FOR LIGHT THEME
  static final lightTOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.widgetbgpurewhite,
      side: const BorderSide(color: TColors.green), // Green border
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColors.black,
        fontWeight: FontWeight.w900,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  // FOR DARK THEME
  static final darkTOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white,
      side: const BorderSide(color: TColors.green), // Green border
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}




// import 'package:flutter/material.dart';

// class TOutlineButtonTheme {
//   TOutlineButtonTheme._();

//   // FOR LIGHT THEME
//   static final lightTOutlineButtonTheme = OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//     elevation: 0,
//     foregroundColor: Colors.black,
//     // backgroundColor: Colors.red,
//     side: const BorderSide(color: Colors.blue),
//     padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
//     textStyle: const TextStyle( fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    
//   )
//   );


// // for Dark mode
//   static final darkTOutlineButtonTheme = OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//     elevation: 0,
//     foregroundColor: Colors.white,
//     side: const BorderSide(color: Colors.blue),
//     padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
//     textStyle: const TextStyle( fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//   )
//   );



// }