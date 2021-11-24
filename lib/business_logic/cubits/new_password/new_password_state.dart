part of 'new_password_cubit.dart';

abstract class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordLoading extends NewPasswordState {
  final bool isLoading;
  NewPasswordLoading(this.isLoading);
}

class NewPasswordSuccess extends NewPasswordState {
  final String message;
  NewPasswordSuccess({required this.message});
}

class NewPasswordValidatation extends NewPasswordState {
  final bool isValidate;
  NewPasswordValidatation({required this.isValidate});
}

class NewPasswordFailure extends NewPasswordState {
  final String message;
  NewPasswordFailure({required this.message});
}