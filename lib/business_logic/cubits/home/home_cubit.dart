import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/models/student_dashboard.dart';

import 'package:student_app/data/repositories/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  bool isLoading = false;

  Future<void> getStudentDashboard({
    required String studentId,
  }) async {
    changeLoadingView();
    final response =
        await homeRepository.getStudentDashboard(studentId: studentId.trim());
    changeLoadingView();
    if (response['status'] == 'Success') {
      emit(
          StudentDashboardSuccess(StudentDashboard.fromJson(response['data'])));
    } else {
      emit(StudentDashboardFailure(message: response['message']));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(HomeLoadingState(isLoading));
  }
}
