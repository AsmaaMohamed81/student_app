import 'package:get_it/get_it.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';
import 'package:student_app/data/api/dio_consumer.dart';
import 'package:student_app/data/api/http_consumer.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory<LocaleCubit>(() => LocaleCubit());
  sl.registerLazySingleton<HttpConsumer>(() => HttpConsumer());
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer());
}
