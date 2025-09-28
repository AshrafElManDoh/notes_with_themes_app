import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPref {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      await _pref.setInt(key, value);
    } else if (value is bool) {
      await _pref.setBool(key, value);
    } else if (value is String) {
      await _pref.setString(key, value);
    }
  }

  static dynamic getData(String key) {
    return _pref.get(key);
  }
}
