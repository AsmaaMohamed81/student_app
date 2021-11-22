import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/data/repositories/forget_password_repository.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository authRepository;
  ForgotPasswordCubit({required this.authRepository})
      : super(ForgotPasswordInitial());

  bool isLoading = false;
  // bool isLoadingresend = false;
  // bool isLoadingverify = false;
  // bool isLoadingresetpass = false;

  Future<void> forgotPasswordByEmail({
    required GlobalKey<FormState> formKey,
    required String email,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await authRepository.forgotPasswordByEmail(
        email: email,
      );
      changeLoadingView();
      if (response['status'] == 'Success') {
        emit(ForgotPasswordSuccess(message: response['message']));
      } else {
        emit(ForgotPasswordFailure(message: response['message']));
      }
    } else {
      emit(ForgotPasswordValidatation(isValidate: true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(ForgotPasswordLoading(isLoading));
  }
  // Future<void> resendEmail({
  //   required GlobalKey<FormState> formKey,
  //   required String email,
  // }) async {
  //   // changeLoadingViewresend();
  //   // final response = await forgetPasswordRepository.sendEmail(
  //   //   email: email,
  //   // );
  //   // changeLoadingViewresend();
  //   // if (response['status'] == 'Success') {
  //   //   // SharedPreferencesFormatter.write(
  //   //   //     "user", User.fromJson(response['data']));
  //   //   emit(ReSentMail(response['message']));
  //   // } else {
  //   //   emit(FailReSendMail(response['message']));
  //   // }
  // }

  // Future<void> sendVeifyCode({
  //   required GlobalKey<FormState> formKey,
  //   required String email,
  //   required String code,
  // }) async {
  //   // if (formKey.currentState != null && formKey.currentState!.validate()) {
  //   //   changeLoadingViewverify();
  //   //   final response = await forgetPasswordRepository.sendVeifyCode(
  //   //       email: email, code: code);
  //   //   changeLoadingViewverify();
  //   //   if (response['status'] == 'Success') {
  //   //     // SharedPreferencesFormatter.write(
  //   //     //     "user", User.fromJson(response['data']));
  //   //     emit(SendVerifyCode(response['message']));
  //   //   } else {
  //   //     emit(FailVerifyCode(response['message']));
  //   //   }
  //   // } else {
  //   //   emit(ForgetPasswordValidateState(true));
  //    }
  // }

  // Future<void> resetLLostPassword({
  //   required GlobalKey<FormState> formKey,
  //   required String email,
  //   required String passWord,
  // }) async {
  //   // if (formKey.currentState != null && formKey.currentState!.validate()) {
  //   //   changeLoadingViewresetpass();
  //   //   final response = await forgetPasswordRepository.resetLostPassword(
  //   //       email: email, passWord: passWord);
  //   //   changeLoadingViewresetpass();
  //   // //   if (response['status'] == 'Success') {
  //   // //     // SharedPreferencesFormatter.write(
  //   // //     //     "user", User.fromJson(response['data']));
  //   // //     emit(ResetLostPassword(response['message']));
  //   // //   } else {
  //   // //     emit(FailResetLostPassword(response['message']));
  //   // //   }
  //   // // } else {
  //   // //   emit(ForgetPasswordValidateState(true));
  //   // }
  // }

  // void changeLoadingViewsend() {
  //   isLoadingsend = !isLoadingsend;
  //   emit(ForgetPasswordLoadingState(isLoadingsend));
  // }

  // void changeLoadingViewresend() {
  //   isLoadingresend = !isLoadingresend;
  //   emit(ForgetPasswordLoadingState(isLoadingresend));
  // }

  // void changeLoadingViewverify() {
  //   isLoadingverify = !isLoadingverify;
  //   emit(ForgetPasswordLoadingState(isLoadingverify));
  // }

  // void changeLoadingViewresetpass() {
  //   isLoadingresetpass = !isLoadingresetpass;
  //   emit(ForgetPasswordLoadingState(isLoadingresetpass));
  // }
}
