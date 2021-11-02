import 'package:flutter/material.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:validators/validators.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String _password = '', _newPassword = '';

  String? validateUserPhone(String phoneNo) {
    if (phoneNo.trim().isEmpty) return 'يرجى إدخال رقم الجوال   ';
    return null;
  }

  String? validateUserNameOrEmail(String? userName) {
    if (userName!.trim().isEmpty)
      return AppLocalizations.of(context)!
          .translate('user_name_or_email_validation')!;

    return null;
  }

  String? validateFirstName(String? fisrtName) {
    if (fisrtName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('first_name_validation_empty');
    } else {
      if (!isLength(fisrtName, 2, 30)) {
        return AppLocalizations.of(context)!
            .translate('first_name_validation_lenght');
      }
    }
    return null;
  }

  String? validateLastName(String? lastName) {
    if (lastName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('last_name_validation_empty');
    } else {
      if (!isLength(lastName, 2, 30)) {
        return AppLocalizations.of(context)!
            .translate('last_name_validation_lenght');
      }
    }
    return null;
  }

  String? validateUserName(String? userName) {
    String pattern = r'^[0-9]';

    String patternsample =
        r'^(?![_.])(?![0-9])(?!.*?[!@#\$&*~])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';

    RegExp regex = RegExp(pattern);
    RegExp regexsample = RegExp(patternsample);

    if (userName!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('user_name_validation_empty');
    } else {
      if (userName.startsWith(regex)) {
        return AppLocalizations.of(context)!.translate('user_name_validation');
      } else {
        if (!regexsample.hasMatch(userName)) {
          return AppLocalizations.of(context)!
              .translate('user_name_validation_sample');
        } else {
          if (!isLength(userName, 8, 30)) {
            return AppLocalizations.of(context)!
                .translate('user_name_valodation_length');
          }
        }
      }
    }
    return null;
  }

  String? validateUserEmail(String? userEmail) {
    if (userEmail!.trim().isEmpty) {
      return AppLocalizations.of(context)!.translate('email_validation')!;
    } else {
      if ((!isEmail(userEmail))) {
        return AppLocalizations.of(context)!
            .translate('email_validation_example')!;
      }
    }

    return null;
  }

  String? validateAddress(String lName) {
    if (lName.trim().isEmpty) return 'يرجى إدخال العنوان بالتفصيل';

    return null;
  }

  String? validatePassword(String? password) {
    _password = password!;
    if (password.isEmpty) {
      return AppLocalizations.of(context)!
          .translate('password_validation_valid')!;
    }

    return null;
  }

  String? validatePasswordsignup(String? password) {
    _password = password!;

    // Pattern pattern =
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    String pattern = r'^(?![_.])[a-zA-Z0-9!@#\$&*~._]+(?<![_.]).{7,}$';

    RegExp regex = RegExp(pattern);
    print(password);
    if (password.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('password_validation_valid');
    } else {
      if (password.length < 8) {
        return AppLocalizations.of(context)!
            .translate('password_validation_symbols');
      } else {
        return null;
      }
    }
  }

  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('confirm_password_validation');
    } else if (_password != confirmPassword) {
      return AppLocalizations.of(context)!
          .translate('confirm_password_validation_duplicat');
    }
    return null;
  }

  String? validateCurrentPassword(String password) {
    if (password.trim().length < 6) {
      return 'كلمه المرور  لا تقل عن 6 حروف او أرقام';
    }

    return null;
  }

  String? validateNewPassword(String newPassword) {
    _newPassword = newPassword;
    if (newPassword.trim().length < 6) {
      return 'كلمة المرور الجديدة  لا تقل عن 6 حروف أو أرقام';
    }
    return null;
  }

  String? validateConfirmNewPassword(String confirmNewPassword) {
    if (confirmNewPassword.trim().length < 6) {
      return 'تأكيد كلمة المرور الجديدة  لا يقل عن 6 حروف أو أرقام';
    } else if (_newPassword != confirmNewPassword) {
      return 'كلمة المرور الجديدة غير متطابقة';
    }

    return null;
  }

  String? validateCode(String? material) {
    if (material!.trim().isEmpty) {
      return " ";
    }
    return null;
  }
}
