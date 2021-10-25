import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';
import 'package:student_app/presentation/routes/app_routes.dart';
import 'package:student_app/presentation/themes/app_theme.dart';
import 'package:student_app/utils/injection_container.dart' as di;
import 'business_logic/cubits/auth/auth_cubit.dart';
import 'locale/app_localizations_setup.dart';

class StudentApp extends StatelessWidget {
  const StudentApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<LocaleCubit>()..changeStartLang(),
        ),
         BlocProvider(
          create: (_) => di.sl<AuthCubit>()..getSavedCredential(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return ScreenUtilInit(
              designSize: const Size(360, 690),
              builder: () => MaterialApp(
                    title: 'Student App',
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    theme: themeData(),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    locale: localeState.locale,
                  ));
        },
      ),
    );
  }
}
