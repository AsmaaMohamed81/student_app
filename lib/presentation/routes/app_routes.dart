import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:student_app/presentation/screens/auth/choosing_login_or_signup/choosing_login_or_signup.dart';
import 'package:student_app/presentation/screens/auth/login.dart';
import 'package:student_app/presentation/screens/auth/signup.dart';
import 'package:student_app/presentation/screens/forget_pass_screen/add_mail_screen.dart';
import 'package:student_app/presentation/screens/forget_pass_screen/new_password_screen.dart';
import 'package:student_app/presentation/screens/forget_pass_screen/verify_code_screen.dart';
import 'package:student_app/presentation/screens/home.dart';
import 'package:student_app/presentation/screens/intro_screen.dart';
import 'package:student_app/presentation/screens/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    //final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(
            builder: (_) => BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                    if (authState is LogedIn) {
                      return const HomeScreen();
                    }
                    if (authState is FailLogIn) {
                      return const IntroScreen();
                    }
                    return const IntroScreen();
                  },
                ));
      case '/choosing_login_or_signup':
        return MaterialPageRoute(
            builder: (_) => const ChoosingLoginOrSignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/add_mail_screen':
        return MaterialPageRoute(builder: (_) => const AddMailScreen());
      case '/verify_code_screen':
        var email = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => VerifyCodeScreen(email: email));
      case '/new_passWord_screen':
        var email = routeSettings.arguments as String;

        return MaterialPageRoute(
            builder: (_) => NewPassWordScreen(email: email));
      default:
        return null;
    }
  }
}
