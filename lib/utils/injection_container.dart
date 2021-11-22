import 'package:get_it/get_it.dart';
import 'package:student_app/business_logic/cubits/forgot_password/forgot_password_cubit.dart';
import 'package:student_app/business_logic/cubits/home/home_cubit.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';
import 'package:student_app/business_logic/cubits/login/login_cubit.dart';
import 'package:student_app/business_logic/cubits/sign_up/sign_up_cubit.dart';
import 'package:student_app/business_logic/cubits/verify_code/verify_code_cubit.dart';
import 'package:student_app/data/api/dio_consumer.dart';
import 'package:student_app/data/api/http_consumer.dart';
import 'package:student_app/data/repositories/auth_repository.dart';
import 'package:student_app/data/repositories/forget_password_repository.dart';
import 'package:student_app/data/repositories/home_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //Futures bloc
  sl.registerFactory<LocaleCubit>(() => LocaleCubit());
  sl.registerFactory<LoginCubit>(() => LoginCubit(authRepository: sl.call()));
  sl.registerFactory<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(authRepository: sl.call()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: sl.call()));
  sl.registerFactory<SignupCubit>(() => SignupCubit(authRepository: sl.call()));
sl.registerFactory<VerifyCodeCubit>(() => VerifyCodeCubit(authRepository: sl.call()));
  //repository
  sl.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepository(dioConsumer: sl.call()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepository(dioConsumer: sl.call()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepository(dioConsumer: sl.call()));

  //External
  sl.registerLazySingleton<HttpConsumer>(() => HttpConsumer());
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer());
}
