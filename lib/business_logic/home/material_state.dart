part of 'material_cubit.dart';

abstract class MaterialState {}

class MaterialInitial extends MaterialState {}

class MaterialLoadingState extends MaterialState {
  final bool isLoading;
  MaterialLoadingState(this.isLoading);
}

class GetStudentMaterial extends MaterialState {
  final StudentMaterial studentMaterial;

  GetStudentMaterial(
    this.studentMaterial,
  );
}
