// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
// import 'package:timeliner/business_logic/cubits/curated_category/curated_category_cubit.dart';
// import 'package:timeliner/business_logic/cubits/curated_source/curated_source_cubit.dart';
// import 'package:timeliner/presentation/pages/about.dart';
// import 'package:timeliner/presentation/pages/auth.dart';
// import 'package:timeliner/presentation/pages/home.dart';
// import 'package:timeliner/presentation/pages/setup.dart';
// import 'package:timeliner/presentation/pages/view_article.dart';

import 'package:flutter/material.dart';
import 'package:student_app/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return null;
    }
  }
}