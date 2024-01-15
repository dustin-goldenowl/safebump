import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class _keys {
  static const String theme = 'app-theme';
  static const String user = 'user';
  static const String token = 'token';
  static const String pergnancyDay = 'pergnancyDay';
  static const String firstOpen = 'firstOpen';
}

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  static UserPrefs get I => instance;
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme
  ThemeMode getTheme() {
    final value = _prefs.getString(_keys.theme);
    return ThemeMode.values.firstWhere(
      (e) => e.toString().toLowerCase() == '$value'.toLowerCase(),
      orElse: () => ThemeMode.system,
    );
  }

  void setTheme(ThemeMode value) {
    _prefs.setString(_keys.theme, value.toString().toLowerCase());
  }

  String getToken() {
    try {
      return _prefs.getString(_keys.token) ?? '';
    } catch (_) {}
    return '';
  }

  void setToken(String? value) {
    if (value == null) {
      _prefs.remove(_keys.token);
    } else {
      _prefs.setString(_keys.token, value);
    }
  }

  // user
  void setUser(MUser? value) {
    if (value == null) {
      _prefs.remove(_keys.user);
    } else {
      _prefs.setString(_keys.user, jsonEncode(value.toJson()));
    }
  }

  MUser? getUser() {
    final value = _prefs.getString(_keys.user);
    try {
      if ((value ?? '').isEmpty) {
        return null;
      } else {
        final map = jsonDecode(value!);
        if (map['id'] == null) {
          return null;
        } else {
          return MUser.fromJson(map);
        }
      }
    } catch (e) {
      xLog.e(e);
      return null;
    }
  }

  DateTime getPergnancyDay() {
    try {
      final pergnancyDayStr = _prefs.getString(_keys.pergnancyDay);
      return DateFormat("y/M/d").parse(pergnancyDayStr!);
    } catch (e) {
      xLog.e(e);
      return DateTime.now();
    }
  }

  void setPergnancyDay(DateTime date) {
    _prefs.setString(_keys.pergnancyDay, DateFormat("y/M/d").format(date));
  }

  //First open App
  bool getIsFirstOpenApp() {
    try {
      final isFirst = _prefs.getBool(_keys.firstOpen);
      if (isFirst == null) return true;
      return isFirst;
    } catch (e) {
      xLog.e(e);
      return true;
    }
  }

  void setIsFirstOpenApp(bool isFirst) {
    _prefs.setBool(_keys.firstOpen, isFirst);
  }
}
