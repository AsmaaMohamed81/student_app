import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFormatter {
  static read(String key) async {
    final p = await prefs;
    if (p.getString(key) != null) {
      return json.decode(p.getString(key)!);
    } else {
      return null;
    }
  }

  static write(String key, value) async {
    final p = await prefs;
    p.setString(key, json.encode(value));
  }

  static remove(String key) async {
    final p = await prefs;
    p.remove(key);
  }

  static Future<bool> getBoolean(String key, bool initValue) async {
    final p = await prefs;
    return p.containsKey(key) ? p.getBool(key)! : initValue;
  }

  static Future<bool> saveBoolean(
    String key,
    bool value,
  ) async {
    final p = await prefs;
    return p.setBool(key, value);
  }

  static Future<String> getString(String key, String defaultValue) async {
    final p = await prefs;
    return p.containsKey(key) ? p.getString(key)! : defaultValue;
  }

  static Future<bool> saveString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }

  static Future<bool> setIsFirstTime(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("first_time", value);
  }

  static Future<bool> checkIsFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("first_time") ?? true;
  }

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
