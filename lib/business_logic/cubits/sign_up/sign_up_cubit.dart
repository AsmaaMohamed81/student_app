import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/utils/strings.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;
  SignUpCubit({required this.authRepository}) : super(SignUpInitial());

  bool isLoading = false;

  Future<void> signUp({
    required GlobalKey<FormState> formKey,
    required String userName,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await authRepository.signUp(
          email: email,
          password: password,
          confirmPassword: password,
          firstName: firstName,
          lastName: lastName,
          userName: userName);
      changeLoadingView();
      if (response['status'] == 'Success') {
        emit(SignUpSucccess(message: response['message']));
      } else {
        emit(SignUpFailure(message: response['message']));
      }
    } else {
      emit(SignUpValidatation(isValidate: true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(SignUpLoading(isLoading));
  }
}
