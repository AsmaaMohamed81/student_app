part of 'signup_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {
  final bool isLoading;
  SignUpLoading(this.isLoading);
}

class SignUpSucccess extends SignUpState {
  final String message;
  SignUpSucccess({required this.message});

  void navigate(context) => Navigator.of(context).pushNamed(loginRoute);
}

class SignUpValidatation extends SignUpState {
  final bool isValidate;
  SignUpValidatation({required this.isValidate});
}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure({required this.message});
}
