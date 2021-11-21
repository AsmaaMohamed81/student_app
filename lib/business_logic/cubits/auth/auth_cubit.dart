import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/models/user.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/utils/preferences_formatter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  bool isLoadingLogin = false;
  bool isLoadingSignUp = false;

  void getSavedCredential() async {
    var userData = await SharedPreferencesFormatter.read("user");
    if (userData != null) {
      emit(LogedIn(User.fromJson(userData)));
      emit(SignUp(User.fromJson(userData)));
    }
  }

  Future<void> login(
      {required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingLogInView();
      final response = await authRepository.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      changeLoadingLogInView();
      if (response['status'] == 'Success') {
        SharedPreferencesFormatter.write(
            "user", User.fromJson(response['data']));
        emit(LogedIn(User.fromJson(response['data'])));
      } else {
        emit(FailLogIn(response['message']));
      }
    } else {
      emit(AuthValidateState(true));
    }
  }

  Future<void> signUp({
    required GlobalKey<FormState> formKey,
    required TextEditingController userNameController,
    required TextEditingController emailController,
    required TextEditingController firstNameController,
    required TextEditingController lasrNameController,
    required TextEditingController passwordController,
    required TextEditingController confirmpasswordController,
  }) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingSignUpView();
      final response = await authRepository.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          confirmPassword: confirmpasswordController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lasrNameController.text.trim(),
          userName: userNameController.text.trim());
      changeLoadingSignUpView();
      if (response['status'] == 'Success') {
        SharedPreferencesFormatter.write(
            "user", User.fromJson(response['data']));
        emit(SignUp(User.fromJson(response['data'])));
      } else {
        emit(FailSignUp(response['message']));
      }
    } else {
      emit(AuthValidateState(true));
    }
  }

  void changeLoadingLogInView() {
    isLoadingLogin = !isLoadingLogin;
    emit(AuthLoadingState(isLoadingLogin));
  }

  void changeLoadingSignUpView() {
    isLoadingSignUp = !isLoadingSignUp;
    emit(AuthLoadingState(isLoadingSignUp));
  }
}
