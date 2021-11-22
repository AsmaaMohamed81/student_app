part of 'verify_code_cubit.dart';

abstract class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {
  final bool isLoading;
  VerifyCodeLoading(this.isLoading);
}

class VerifyCodeSuccess extends VerifyCodeState {
  final String message;
  VerifyCodeSuccess({required this.message});
}

class VerifyCodeValidatation extends VerifyCodeState {
  final bool isValidate;
  VerifyCodeValidatation({required this.isValidate});
}

class VerifyCodeFailure extends VerifyCodeState {
  final String message;
  VerifyCodeFailure({required this.message});
}