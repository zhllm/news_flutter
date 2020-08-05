import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:newsflutter/common/values/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _instance = new StorageUtil._();

  factory StorageUtil() => _instance;
  static SharedPreferences _preferences;

  StorageUtil._();

  static Future<void> init() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _preferences.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String jsonString = _preferences.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _preferences.setBool(key, val);
  }

  bool getBool(String key) {
    var value = _preferences.getBool(key);
    return value == null ? false : value;
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
