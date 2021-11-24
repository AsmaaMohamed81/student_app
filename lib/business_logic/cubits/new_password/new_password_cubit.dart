import 'package:bloc/bloc.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
   final AuthRepository authRepository;
  NewPasswordCubit({required this.authRepository}) : super(NewPasswordInitial());

    bool isLoading = false;


     void changeLoadingView() {
    isLoading = !isLoading;
    emit(NewPasswordLoading(isLoading));
  }
}
