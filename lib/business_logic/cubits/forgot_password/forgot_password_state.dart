part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {
  final bool isLoading;
  ForgotPasswordLoading(this.isLoading);
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;
  ForgotPasswordSuccess({required this.message});
}

class ForgotPasswordValidatation extends ForgotPasswordState {
  final bool isValidate;
  ForgotPasswordValidatation({required this.isValidate});
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String message;
  ForgotPasswordFailure({required this.message});
}

// class ReSentMail extends ForgetPasswordState {
//   final String message;

//   ReSentMail(this.message);
// }

// class FailReSendMail extends ForgetPasswordState {
//   final String message;

//   FailReSendMail(this.message);
// }

// class FailVerifyCode extends ForgetPasswordState {
//   final String message;

//   FailVerifyCode(this.message);
// }

// class SendVerifyCode extends ForgetPasswordState {
//   final String message;

//   SendVerifyCode(this.message);
// }

// class FailResetLostPassword extends ForgetPasswordState {
//   final String message;

//   FailResetLostPassword(this.message);
// }

// class ResetLostPassword extends ForgetPasswordState {
//   final String message;

//   ResetLostPassword(this.message);
// }
