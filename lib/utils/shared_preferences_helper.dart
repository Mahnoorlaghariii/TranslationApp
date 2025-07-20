import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const isLoggedInKey = "isLoggedIn";

  static Future<bool> saveLoggin(bool value) async  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isLoggedInKey, value);
      }

      static Future<bool> isLoggedIn() async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.getBool(isLoggedInKey) ?? false;
      }

      static Future<void> clearAll() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
      }
}

