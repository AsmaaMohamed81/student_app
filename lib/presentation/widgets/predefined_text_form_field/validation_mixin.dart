import 'package:flutter/material.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:validators/validators.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String _password = '';

  String? validateUserPhone(String phoneNo) {
    if (phoneNo.trim().isEmpty) return 'يرجى إدخال رقم الجوال   ';
    return null;
  }

  String? validateUserNameOrEmail(String? userName) {
    if (userName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('user_name_or_email_validation')!;
    }

    return null;
  }

  String? validateFirstName(String? fisrtName) {
    String patternDetectStartWithSpecialCharsOrNumbers =
        r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regexDetectStartWithSpecialCharsOrNumbers =
        RegExp(patternDetectStartWithSpecialCharsOrNumbers);
    if (fisrtName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('first_name_validation_when_empty');
    } else if (regexDetectStartWithSpecialCharsOrNumbers.hasMatch(fisrtName)) {
      return AppLocalizations.of(context)!
          .translate('first_name_validation_sample');
    } else if (!isLength(fisrtName, 2, 30)) {
      return AppLocalizations.of(context)!
          .translate('first_name_validation_on_length');
    }

    return null;
  }

  String? validateLastName(String? lastName) {
    String patternDetectStartWithSpecialCharsOrNumbers =
        r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regexDetectStartWithSpecialCharsOrNumbers =
        RegExp(patternDetectStartWithSpecialCharsOrNumbers);
    if (lastName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('last_name_validation_when_empty');
    } else if (regexDetectStartWithSpecialCharsOrNumbers.hasMatch(lastName)) {
      return AppLocalizations.of(context)!
          .translate('last_name_validation_sample');
    } else if (!isLength(lastName, 2, 30)) {
      return AppLocalizations.of(context)!
          .translate('last_name_validation_on_length');
    }

    return null;
  }

  String? validateUserName(String? userName) {
    String patternForOnlyDigits = r'^[0-9]';
    String userNamePattern =
        r'^(?![_.])(?![0-9])(?!.*?[!@#\$&*~])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
    RegExp regexOfStartWithDigit = RegExp(patternForOnlyDigits);
    RegExp userNameRegex = RegExp(userNamePattern);
    if (userName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('user_name_validation_empty');
    } else if (userName.startsWith(regexOfStartWithDigit)) {
      return AppLocalizations.of(context)!.translate('user_name_validation');
    } else if (!userNameRegex.hasMatch(userName)) {
      return AppLocalizations.of(context)!
          .translate('user_name_validation_sample');
    } else if (!isLength(userName, 8, 30)) {
      return AppLocalizations.of(context)!
          .translate('user_name_valodation_length');
    }
    return null;
  }

  String? validateEmail(String? userEmail) {
    if (userEmail!.trim().isEmpty) {
      return AppLocalizations.of(context)!.translate('email_validation')!;
    } else if ((!isEmail(userEmail))) {
      return AppLocalizations.of(context)!
          .translate('email_validation_example')!;
    }
    return null;
  }

  String? validatePasswordForLogin(String? password) {
    if (password!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('password_validation_when_empty')!;
    }

    return null;
  }

  String? validatePasswordForSignUp(String? password) {
    _password = password!;
    if (password.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('password_validation_when_empty');
    } else if (password.length < 8) {
      return AppLocalizations.of(context)!.translate('password_validation_msg');
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('confirm_password_validation');
    } else if (_password != confirmPassword) {
      return AppLocalizations.of(context)!.translate('password_not_identical');
    }
    return null;
  }
}
