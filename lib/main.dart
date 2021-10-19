import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/app.dart';
import 'package:student_app/utils/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => run());
}

void run() async => runApp(const StudentApp());
