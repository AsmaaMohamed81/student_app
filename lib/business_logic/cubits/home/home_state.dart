part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  final bool isLoading;
  HomeLoadingState(this.isLoading);
}

class GetStudentInfo extends HomeState {
  final StudentInformation studentInformation;

  GetStudentInfo(
    this.studentInformation,
  );
}

class GetStudentMaterail extends HomeState {
  final StudentDashboard studentDashboard;

  GetStudentMaterail(
    this.studentDashboard,
  );
}
