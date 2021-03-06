import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/models/user.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/utils/preferences_formatter.dart';
import 'package:student_app/utils/strings.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit({required this.authRepository}) : super(LoginInitial());

  bool isLoading = false;

  void getSavedCredential() async {
    var userData = await SharedPreferencesFormatter.read("user");
    if (userData != null) {
      emit(Authenticated(user: User.fromJson(userData)));
    }
  }

  Future<void> login(
      {required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final response = await authRepository.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      changeLoadingView();
      if (response['status'] == 'Success') {
        SharedPreferencesFormatter.write(
            "user", User.fromJson(response['data']));
        emit(Authenticated(user: User.fromJson(response['data'])));
      } else {
        emit(UnAuthenticated(message: response['message']));
      }
    } else {
      emit(LoginValidatation(isValidate: true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading));
  }

  void logout(BuildContext context) {
    emit(UnAuthenticated(message: ''));
    SharedPreferencesFormatter.remove("user");
    Navigator.of(context)
        .pushNamedAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
  }
}
