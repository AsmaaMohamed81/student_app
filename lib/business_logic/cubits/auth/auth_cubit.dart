import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/models/user.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/utils/preferences_formatter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  bool isLoading = false;

  void getSavedCredential() async {
    var userData = await SharedPreferencesFormatter.read("user");
    if (userData != null) {
      emit(Authenticated(User.fromJson(userData)));
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
        emit(Authenticated(User.fromJson(response['data'])));
      } else {
        emit(UnAuthenticated(response['message']));
      }
    } else {
      emit(AuthValidateState(true));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(AuthLoadingState(isLoading));
  }
}
