import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:meta/meta.dart';
import 'package:student_app/utils/preferences_formatter.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const SelectedLocale(Locale('en')));

  Future<void> _changeLocale(String locale) async {
    SharedPreferencesFormatter.saveString('locale', locale);
    emit(SelectedLocale(Locale(locale)));
  }

  void changeStartLang() async {
    String langCode = await SharedPreferencesFormatter.getString('locale', 'en');
    emit(SelectedLocale(Locale(langCode)));
  }

  void toEnglish() => _changeLocale('en');
  void toArabic() => _changeLocale('ar');
}
