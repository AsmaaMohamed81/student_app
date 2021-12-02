import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/business_logic/cubits/forgot_password/forgot_password_cubit.dart';
import 'package:student_app/business_logic/cubits/login/login_cubit.dart';
import 'package:student_app/business_logic/cubits/new_password/new_password_cubit.dart';
import 'package:student_app/business_logic/cubits/sign_up/sign_up_cubit.dart';
import 'package:student_app/business_logic/cubits/verify_code/verify_code_cubit.dart';
import 'package:student_app/presentation/screens/auth/choosing_login_or_signup/choosing_login_or_signup.dart';
import 'package:student_app/presentation/screens/auth/login.dart';
import 'package:student_app/presentation/screens/auth/sign_up.dart';
import 'package:student_app/presentation/screens/auth/forgot_password.dart';
import 'package:student_app/presentation/screens/auth/new_password.dart';
import 'package:student_app/presentation/screens/auth/verify_code.dart';
import 'package:student_app/presentation/screens/home/home.dart';
import 'package:student_app/presentation/screens/intro_screen.dart';
import 'package:student_app/presentation/screens/splash_screen.dart';
import 'package:student_app/utils/strings.dart';
import 'package:student_app/utils/injection_container.dart' as di;

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, loginState) {
                    if (loginState is Authenticated) {
                      return Home(studentId: loginState.user.mainRoleId);
                    } else if (loginState is UnAuthenticated) {
                      return const ChoosingLoginOrSignUpScreen();
                    } else {
                      const ChoosingLoginOrSignUpScreen();
                    }
                    return const ChoosingLoginOrSignUpScreen();
                  },
                ));
      case introRoute:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case choosingLoginOrSignUpRoute:
        return MaterialPageRoute(
            builder: (_) => const ChoosingLoginOrSignUpScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.sl<SignUpCubit>(),
                child: const SignUpScreen()));
      case forgotPasswordRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.sl<ForgotPasswordCubit>(),
                child: const ForgotPasswordScreen()));
      case verifyCodeRoute:
        var email = args as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.sl<VerifyCodeCubit>(),
                child: VerifyCodeScreen(
                  email: email,
                )));
      case newPasswordRoute:
        var email = args as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.sl<NewPasswordCubit>(),
                child: NewPassWordScreen(
                  email: email,
                )));
      default:
        return null;
    }
  }
}
