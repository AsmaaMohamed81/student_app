part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {
  final bool isLoading;
  ForgetPasswordLoadingState(this.isLoading);
}

class SentMail extends ForgetPasswordState {
  final String message;

  SentMail(this.message);
}

class ForgetPasswordValidateState extends ForgetPasswordState {
  final bool isValidate;

  ForgetPasswordValidateState(this.isValidate);
}

class FailSendMail extends ForgetPasswordState {
  final String message;

  FailSendMail(this.message);
}

class FailVerifyCode extends ForgetPasswordState {
  final String message;

  FailVerifyCode(this.message);
}

class SendVerifyCode extends ForgetPasswordState {
  final String message;

  SendVerifyCode(this.message);
}

class FailResetLostPassword extends ForgetPasswordState {
  final String message;

  FailResetLostPassword(this.message);
}

class ResetLostPassword extends ForgetPasswordState {
  final String message;

  ResetLostPassword(this.message);
}
