import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<String> getString({
    @required String key,
    String fallback = '',
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? fallback;
  }

  static Future<void> setString({
    @required String key,
    @required String value,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
