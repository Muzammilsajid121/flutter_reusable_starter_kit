

import 'package:shared_preferences/shared_preferences.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  // Private constructor
  TLocalStorage._internal();

  // Singleton instance
  factory TLocalStorage() => _instance;

  static SharedPreferences? _prefs;

  // Initializing SharedPreferences (isko main.dart mein call karna hai)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // --- Generic Save Method ---
  Future<void> saveData<T>(String key, T value) async {
    if (_prefs == null) await init();

    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    }
  }

  // --- Generic Read Method ---
  T? readData<T>(String key) {
    return _prefs?.get(key) as T?;
  }

  // --- Remove Specific Data ---
  Future<bool> removeData(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  // --- Clear All Data ---
  Future<bool> clearAll() async {
    return await _prefs?.clear() ?? false;
  }

  // Check if Key exists
  bool hasKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}


//--usage
//in main.dart
//WidgetsFlutterBinding.ensureInitialized();
//  await TLocalStorage.init();

// //* to save
// final localStorage = TLocalStorage();  //initializing TLocalStorage
// await localStorage.saveData('access_token', accessToken);
// await localStorage.saveData('refresh_token', refreshToken);
// await localStorage.saveData('student_id', studentId);

// //*to read
// final savedToken = localStorage.readData<String>('access_token');
// final savedId = localStorage.readData<String>('student_id');

// //*to delete
// await localStorage.removeData('access_token');

// //*to clear all
// await localStorage.clearAll();
