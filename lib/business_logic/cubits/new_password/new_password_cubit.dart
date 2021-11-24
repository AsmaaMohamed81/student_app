import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  final AuthRepository authRepository;
  NewPasswordCubit({required this.authRepository})
      : super(NewPasswordInitial());

  bool isLoading = false;

  Future<void> resetLostPassword({
    required GlobalKey<FormState> formKey,
    required String email,
    required String passWord,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await authRepository.resetLostPassword(
          email: email, password: passWord);
      changeLoadingView();
      if (response['status'] == 'Success') {
        emit(NewPasswordSuccess(message: response['message']));
      } else {
        emit(NewPasswordFailure(message: response['message']));
      }
    } else {
      emit(NewPasswordValidatation(isValidate: true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(NewPasswordLoading(isLoading));
  }
}
