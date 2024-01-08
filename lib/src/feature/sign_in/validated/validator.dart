import 'package:flutter/material.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/utils/string_utils.dart';

class Validator {
  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static String? emailValidated(String? value, BuildContext context) {
    if (StringUtils.isNullOrEmpty(value)) {
      return S.of(context).thisFieldIsNotEmpty;
    }
    return emailRegExp.hasMatch(value ?? '')
        ? null
        : S.of(context).emailInvalid;
  }

  static String? passwordValidated(String? value, BuildContext context) {
    if (StringUtils.isNullOrEmpty(value)) {
      return S.of(context).thisFieldIsNotEmpty;
    }
    return null;
  }
}
