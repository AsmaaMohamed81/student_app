import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/data/models/student_dashboard.dart';

import 'package:student_app/data/repositories/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());

  bool isLoading = false;

  Future<void> getStudentInfo({
    required String studentId,
  }) async {
    changeLoadingInfoView();
    final response =
        await homeRepository.getStudentInfo(studentId: studentId.trim());
    changeLoadingInfoView();
    if (response['status'] == 'Success') {
      emit(GetStudentInfo(
          StudentInformation.fromJson(response['data']['studentInformation'])));
      // emit(GetStudentMaterail(StudentDashboard.fromJson(response['data'])));
    } else {}
  }

  void changeLoadingInfoView() {
    isLoading = !isLoading;
    emit(HomeLoadingState(isLoading));
  }
}
