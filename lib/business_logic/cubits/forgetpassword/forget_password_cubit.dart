import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/repositories/forget_password_repository.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepository forgetPasswordRepository;
  ForgetPasswordCubit(this.forgetPasswordRepository)
      : super(ForgetPasswordInitial());

  bool isLoading = false;

  Future<void> sendEmail({
    required GlobalKey<FormState> formKey,
    required String email,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await forgetPasswordRepository.sendEmail(
        email: email,
      );
      changeLoadingView();
      if (response['status'] == 'Success') {
        // SharedPreferencesFormatter.write(
        //     "user", User.fromJson(response['data']));
        emit(SentMail(response['message']));
      } else {
        emit(FailSendMail(response['message']));
      }
    } else {
      emit(ForgetPasswordValidateState(true));
    }
  }

  Future<void> resendEmail({
    required GlobalKey<FormState> formKey,
    required String email,
  }) async {
    changeLoadingView();
    final response = await forgetPasswordRepository.sendEmail(
      email: email,
    );
    changeLoadingView();
    if (response['status'] == 'Success') {
      // SharedPreferencesFormatter.write(
      //     "user", User.fromJson(response['data']));
      emit(SentMail(response['message']));
    } else {
      emit(FailSendMail(response['message']));
    }
  }

  Future<void> sendVeifyCode({
    required GlobalKey<FormState> formKey,
    required String email,
    required String code,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await forgetPasswordRepository.sendVeifyCode(
          email: email, code: code);
      changeLoadingView();
      if (response['status'] == 'Success') {
        // SharedPreferencesFormatter.write(
        //     "user", User.fromJson(response['data']));
        emit(SendVerifyCode(response['message']));
      } else {
        emit(FailVerifyCode(response['message']));
      }
    } else {
      emit(ForgetPasswordValidateState(true));
    }
  }

  Future<void> resetLLostPassword({
    required GlobalKey<FormState> formKey,
    required String email,
    required String passWord,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await forgetPasswordRepository.resetLostPassword(
          email: email, passWord: passWord);
      changeLoadingView();
      if (response['status'] == 'Success') {
        // SharedPreferencesFormatter.write(
        //     "user", User.fromJson(response['data']));
        emit(ResetLostPassword(response['message']));
      } else {
        emit(FailResetLostPassword(response['message']));
      }
    } else {
      emit(ForgetPasswordValidateState(true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(ForgetPasswordLoadingState(isLoading));
  }
}
