part of 'signup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SigupLoading extends SignupState {
  final bool isLoading;
  SigupLoading(this.isLoading);
}

class Signup extends SignupState {
  final User user;
  Signup({required this.user});
}

class SignupValidatation extends SignupState {
  final bool isValidate;
  SignupValidatation({required this.isValidate});
}

class SignupFailed extends SignupState {
  final String message;
  SignupFailed({required this.message});
}
