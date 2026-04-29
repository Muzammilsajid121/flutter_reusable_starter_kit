
import 'package:flutter/material.dart';

class TColors {
  TColors._();

  //--regular colors
  static const Color primaryYellow = Color(0xFFF9C323);      //also used in buttons
  static const Color backgroundColor = Color(0xFFFCF9F8);
  static const Color widgetbgpurewhite = Color(0xFFFFFFFF);  //same color used in appbar
  static const Color widgetbglightgrey = Color(0xFFE5E2E1);
  static const Color widgetbgwhitepale = Color(0xFFF6F3F2);
  static const Color lightYellow = Color(0xFFFFDF97);
  static const Color blackWidgetbg = Color(0xFF1C1B1B);
  static const Color greyWidgetbg = Color(0xFF5F5E5E);

  
  //--dark theme colors
  static const Color backgroundColorDark =  Color.fromARGB(255, 0, 0, 0);
  static const Color widgetbakgroundPureDark = Color(0xFF2F2D2D);
  static const Color widgetbgdarkgrey = Color(0xFFF5F5F5);
  static const Color widgetbgdarkpale = Color(0xff2D2B2B);
  static const Color whiteTextDark = Color(0xFFFFFFFF); // Text in dark mode
  static const Color appBarDark = Color(0xFF272727);

  //--less use colors
  static const Color darkRed = Color(0xFFBA1A1A);
  static const Color lightRed = Color(0xFFFFDAD6);
  static const Color redButton = Color(0xFFFFE8E8);
  static const Color transparent = Color(0xFF000000);
  static const Color textBrownColor = Color(0xFF775A00);
  static const Color darkBrown4F4 = Color(0xFF4F4633);

  // Gradians colors
  static const Gradient linearGaradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [ 
      Color(0xff1C1B1B), Color(0xff2D2B2B),],
  );


static const Gradient dashBoardGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff1C1B1B), // top
    Color(0xff2D2B2B), // bottom
  ],
);




  // Core brand colors
  static const Color green = Color(0xFFF9C323); // Fiverr green primary color of app
  static const Color black = Color(0xFF0F0F0F); // Pure black background in dark theme
  static const Color dropdownBlack = Color.fromARGB(255, 44, 43, 43); // Pure black background in dark theme
  static const Color grey = Color(0xFF2A2A2A);  // Widget backgrounds
  
  static const Color white = Color(0xFFFFFFFF); // Text in dark mode
  static const Color whitebg = Color(0xFFF5F5F5); // Pure soft white background in light theme

  // Additional colors for TTextFormFieldTheme
  static const Color errorRed = Color(0xFFEF5350); // Error color for text fields
  static const Color focusBorderColor = Color(0xFF4CAF50); // Focus border color (Green)

  // Additional (optional) shades if needed
  static const Color lightGrey = Color(0xFFBDBDBD); // For borders or hints
  static const Color darkGrey = Color(0xFF1C1C1C);  // Deeper backgrounds

  //ignore these!!!!!!!!!!!!!!!!!!!!!!!!!!1111111111
  // Appbar basic colors
  static const Color primary = Color(0xFF4b86ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

// Text colors
  static const Color textprimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

//Background COLOR
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

// Background conatiner color
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.textWhite.withValues(alpha: 0.1);

// Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

// border colors
  static const Color borderPrimary = Color(0xFFD9DD9D);
  static const Color borderSecondary = Color(0xFFE6E6E6); 

// ERROR AND VALIDATION COLOR
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFF57C0);
  static const Color info = Color(0xFF197602);




}



