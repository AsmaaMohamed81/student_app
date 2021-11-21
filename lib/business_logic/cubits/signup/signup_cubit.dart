import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/models/user.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/utils/preferences_formatter.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;
  SignupCubit({required this.authRepository}) : super(SignupInitial());

  bool isLoading = false;

  void getSavedCredential() async {
    var userData = await SharedPreferencesFormatter.read("user");
    if (userData != null) {
      emit(Signup(user: User.fromJson(userData)));
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
      changeLoadingView();
      final response = await authRepository.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          confirmPassword: confirmpasswordController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lasrNameController.text.trim(),
          userName: userNameController.text.trim());
      changeLoadingView();
      if (response['status'] == 'Success') {
        SharedPreferencesFormatter.write(
            "user", User.fromJson(response['data']));
        emit(Signup(user: User.fromJson(response['data'])));
      } else {
        emit(SignupFailed(message: response['message']));
      }
    } else {
      emit(SignupValidatation(isValidate: true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(SigupLoading(isLoading));
  }
}
