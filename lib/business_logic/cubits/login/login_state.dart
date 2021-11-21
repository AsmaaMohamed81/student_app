part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final bool isLoading;
  LoginLoading(this.isLoading);
}

class Authenticated extends LoginState {
  final User user;
  Authenticated(
    { required this.user }
  );
}

class  LoginValidatation extends LoginState {
  final bool isValidate;
  LoginValidatation({ required this.isValidate});
}

class UnAuthenticated extends LoginState {
  final String message;
  UnAuthenticated({ required this.message});
}
