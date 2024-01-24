import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safebump/src/config/enum/language_enum.dart';
import 'package:safebump/src/feature/edit_profile/widget/unit_segment.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/utils/string_utils.dart';
import 'package:safebump/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class _keys {
  static const String theme = 'app-theme';
  static const String user = 'user';
  static const String token = 'token';
  static const String pergnancyDay = 'pergnancyDay';
  static const String firstOpen = 'firstOpen';
  static const String doDailyQuiz = 'doDailyQuiz';
  static const String isUserCorrect = 'isUserCorrect';
  static const String percentCorrectDailyQuiz = 'percentCorrectDailyQuiz';
  static const String bodyMeasurementUnitType = 'bodyMeasurementUnitType';
  static const String language = 'language';
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

  void clearSharedPref() {
    setToken(null);
    setUser(null);
    setDoDailyQuiz(false);
    setLanguage(LanguageEnum.english);
    setPercentCorrectDailyQuiz(0);
    setPergnancyDay(DateTime.now());
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
      if (!StringUtils.isNullOrEmpty(pergnancyDayStr)) {
        return DateFormat("y/M/d").parse(pergnancyDayStr!);
      }
      return DateTime.now();
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

  bool getDoDailyQuiz() {
    try {
      return _prefs.getBool(_keys.doDailyQuiz) ?? false;
    } catch (_) {}
    return false;
  }

  void setDoDailyQuiz(bool isAnswer) {
    _prefs.setBool(_keys.doDailyQuiz, isAnswer);
  }

  bool getIsUserCorrect() {
    try {
      return _prefs.getBool(_keys.isUserCorrect) ?? false;
    } catch (_) {}
    return false;
  }

  void setIsUserCorrect(bool isCorrect) {
    _prefs.setBool(_keys.isUserCorrect, isCorrect);
  }

  int getPercentCorrectDailyQuiz() {
    try {
      return _prefs.getInt(_keys.percentCorrectDailyQuiz) ?? 0;
    } catch (_) {}
    return 0;
  }

  void setPercentCorrectDailyQuiz(int percent) {
    _prefs.setInt(_keys.percentCorrectDailyQuiz, percent);
  }

  MeasurementUnitType getBodyMeasurementUnitType() {
    try {
      return MeasurementUnitType.getType(
          _prefs.getString(_keys.bodyMeasurementUnitType) ?? '');
    } catch (_) {}
    return MeasurementUnitType.metric;
  }

  void setBodyMeasurementUnitType(MeasurementUnitType type) {
    _prefs.setString(_keys.bodyMeasurementUnitType, type.getText());
  }

  LanguageEnum getLanguage() {
    try {
      return LanguageEnum.getLanguage(_prefs.getString(_keys.language) ?? '');
    } catch (_) {}
    return LanguageEnum.english;
  }

  void setLanguage(LanguageEnum language) {
    _prefs.setString(_keys.language, language.getText());
  }
}
