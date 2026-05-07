
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';
import 'package:flutter_starter_kit/utils/local_storage/storage_utility.dart';
import 'package:flutter_starter_kit/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('--- APP STARTED FROM MAIN.DART ---');

  //-- Initialize Local Storage
  await TLocalStorage.init();
  
  //-- Set status bar & navigation bar colors/icons
  final isDarkMode = TLocalStorage().readData<bool>('isDarkMode') ?? false;
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      statusBarColor:isDarkMode?  TColors.widgetbakgroundPureDark: TColors.widgetbgpurewhite, //  Transparent status bar
      systemNavigationBarColor:isDarkMode?  TColors.widgetbakgroundPureDark: TColors.widgetbgpurewhite, //  Transparent nav bar
      statusBarIconBrightness:isDarkMode? Brightness.light:Brightness.dark, // Icons visible on light bg
      systemNavigationBarIconBrightness:isDarkMode? Brightness.light:Brightness.dark,
    ),
  );

  runApp(const MyApp());
}



