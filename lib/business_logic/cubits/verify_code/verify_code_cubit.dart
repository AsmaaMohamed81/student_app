import 'package:bloc/bloc.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final AuthRepository authRepository;
  VerifyCodeCubit({required this.authRepository}) : super(VerifyCodeInitial());

  bool isLoadingForVerifyCode = false,
      isLoadingForResendingVerifyCode = false;


  Future<void> verifyCode({
    required String email,
    required String code,
  }) async {

      changeLoadingForVerifyCodeView();
      final response = await authRepository.veifyCode(email: email, code: code);
      changeLoadingForVerifyCodeView();
      if (response['status'] == 'Success') {
        emit(VerifyCodeSuccess(message: response['message']));
      } else {
        emit(VerifyCodeFailure(message: response['message']));
      }
     
  }

  Future<void> resendVerifyCode({
    required String email,
  }) async {
    changeLoadingForResendingVerifyCode();
    final response = await authRepository.forgotPasswordByEmail(
      email: email,
    );
    changeLoadingForResendingVerifyCode();
    if (response['status'] == 'Success') {
      emit(ResendingCodeSuccess( message:response['message']));
    } else {
    emit(ResendingCodeFailure( message:response['message']));
    }
  }

  
  void changeLoadingForVerifyCodeView() {
    isLoadingForVerifyCode = !isLoadingForVerifyCode;
    emit(VerifyCodeLoading(isLoadingForVerifyCode));
  }

  void changeLoadingForResendingVerifyCode() {
    isLoadingForResendingVerifyCode = !isLoadingForResendingVerifyCode;
    emit(VerifyCodeLoading(isLoadingForResendingVerifyCode));
  }
}
