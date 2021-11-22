import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
    final AuthRepository authRepository;
  VerifyCodeCubit({required this.authRepository}) : super(VerifyCodeInitial());
 
  bool isLoading = false;

  Future<void> verifyCode({
    required GlobalKey<FormState> formKey,
    required String email,
    required String code,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await authRepository.veifyCode(
          email: email, code: code);
      changeLoadingView();
      if (response['status'] == 'Success') {
        emit(VerifyCodeSuccess(message: response['message']));
      } else {
        emit(VerifyCodeFailure(message: response['message']));
      }
    } else {
      emit( VerifyCodeValidatation(isValidate: true));
     }
  }

   void changeLoadingView() {
    isLoading = !isLoading;
    emit(VerifyCodeLoading(isLoading));
  }
}
