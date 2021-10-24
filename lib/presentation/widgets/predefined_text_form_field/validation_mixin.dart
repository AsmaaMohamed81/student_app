import 'package:flutter/material.dart';
import 'package:student_app/locale/app_localizations.dart';


mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String _password = '', _newPassword = '';

  String? validateUserEmail(String userEmail) {
    if (userEmail.trim().isEmpty) {
      return AppLocalizations.of(context)!.translate('email_validation');
    }

    return null;
  }

  String? validateUserPhone(String phoneNo) {
    if (phoneNo.trim().isEmpty) return 'يرجى إدخال رقم الجوال   ';
    return null;
  }

  String? validateUserName(String userName) {
    if (userName.trim().isEmpty) return 'يرجى إدخال اسم المستخدم';

    return null;
  }

  String? validateFirstName(String fName) {
    if (fName.trim().isEmpty) return 'يرجى إدخال الاسم الأول';

    return null;
  }

  String? validateLastName(String lName) {
    if (lName.trim().isEmpty) return 'يرجى إدخال الاسم الأخير';

    return null;
  }

  String? validateAddress(String lName) {
    if (lName.trim().isEmpty) return 'يرجى إدخال العنوان بالتفصيل';

    return null;
  }

  String? validatePassword(String password) {
    _password = password;
    if (password.trim().length < 6) {
      return 'كلمة المرور لا تقل عن 6 حروف او أرقام';
    }

    return null;
  }

  String? validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.trim().length < 6) {
      return 'تأكيد كلمة المرور لا يقل عن 6 حروف او أرقام';
    } else if (_password != confirmPassword) {
      return AppLocalizations.of(context)!.translate('Password_not_identical');
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



  
}
