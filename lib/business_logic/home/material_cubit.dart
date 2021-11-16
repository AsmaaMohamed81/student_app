import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student_app/data/models/student_material.dart';

import 'package:student_app/data/repositories/home_repository.dart';
part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialState> {
  final HomeRepository homeRepository;
  MaterialCubit(this.homeRepository) : super(MaterialInitial());

  bool isLoading = false;

  Future<void> getStudentMatrial({
    required String courseId,
  }) async {
    changeLoadingMaterialView();
    final response =
        await homeRepository.getStudentMatrial(classId: courseId.trim());
    changeLoadingMaterialView();
    if (response['status'] == 'Success') {
      emit(GetStudentMaterial(StudentMaterial.fromJson(response['data'])));
    } else {}
  }

  void changeLoadingMaterialView() {
    isLoading = !isLoading;
    emit(MaterialLoadingState(isLoading));
  }
}
