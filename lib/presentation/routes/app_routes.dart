import 'package:flutter/material.dart';
import 'package:student_app/presentation/screens/auth/choosing_login_or_signup/choosing_login_or_signup.dart';
import 'package:student_app/presentation/screens/auth/login.dart';
import 'package:student_app/presentation/screens/intro_screen.dart';
import 'package:student_app/presentation/screens/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    //final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/intro':
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case '/choosing_login_or_signup':
        return MaterialPageRoute(
            builder: (_) => const ChoosingLoginOrSignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null;
    }
  }
}
