
part of 'locale_cubit.dart';



@immutable
abstract class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState(this.locale);
}

class SelectedLocale extends LocaleState {
  const SelectedLocale(Locale locale) : super(locale);

  @override
  List<Object?> get props => [];
}
