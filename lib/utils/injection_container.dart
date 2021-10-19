import 'package:get_it/get_it.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<LocaleCubit>(() => LocaleCubit());
}
