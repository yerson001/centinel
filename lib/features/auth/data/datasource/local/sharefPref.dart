import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharefPref {
  Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    if (value != null && value.isNotEmpty) {
      return json.decode(value);
    }
    return null;
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
