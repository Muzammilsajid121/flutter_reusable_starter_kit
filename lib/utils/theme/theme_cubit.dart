import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_kit/utils/local_storage/storage_utility.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  static const String _themeKey = 'isDarkMode';

  void _loadTheme() {
    final bool? isDarkMode = TLocalStorage().readData<bool>(_themeKey);
    if (isDarkMode != null) {
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    } else {
      emit(ThemeMode.light); // Default to light
    }
  }

  void toggleTheme(bool isDark) {
    TLocalStorage().saveData(_themeKey, isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}


//--how to use in toogle
          // BlocBuilder<ThemeCubit, ThemeMode>(
          //   builder: (context, themeMode) {
          //     return TSettingsMenuTileWidget(
          //       icon: Icons.dark_mode,
          //       title: 'Hidden Dark Mode',
          //       isToggle: true,
          //       value: themeMode == ThemeMode.dark,
          //       onChanged: (value) {
          //         context.read<ThemeCubit>().toggleTheme(value);
          //       },
          //     );
          //   },
          // ),