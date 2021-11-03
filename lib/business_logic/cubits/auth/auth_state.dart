part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  final bool isLoading;
  AuthLoadingState(this.isLoading);
}

class LogedIn extends AuthState {
  final User user;

  LogedIn(
    this.user,
  );
}

class SignUp extends AuthState {
  final User user;

  SignUp(
    this.user,
  );
}

class AuthValidateState extends AuthState {
  final bool isValidate;

  AuthValidateState(this.isValidate);
}

class FailLogIn extends AuthState {
  final String message;

  FailLogIn(this.message);
}

class FailSignUp extends AuthState {
  final String message;

  FailSignUp(this.message);
}
