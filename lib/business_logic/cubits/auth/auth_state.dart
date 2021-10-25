part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
    final bool isLoading;
      AuthLoadingState(this.isLoading);
}

class Authenticated extends AuthState {
  final User user;

  Authenticated(
    this.user,
  );
}

class AuthValidateState extends AuthState {
  final bool isValidate;

  AuthValidateState(this.isValidate);
}

class UnAuthenticated extends AuthState {
  final String message;

  UnAuthenticated(this.message);
}
