part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  final bool isLoading;
  HomeLoadingState(this.isLoading);
}

class StudentDashboardSuccess extends HomeState {
  final StudentDashboard studentDashboard;

  StudentDashboardSuccess(
    this.studentDashboard,
  );
}

class StudentDashboardFailure extends HomeState {
  final String message;
  StudentDashboardFailure({required this.message});
}
