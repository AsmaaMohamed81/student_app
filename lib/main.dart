import 'package:flutter/material.dart';
import 'package:student_app/app.dart';
import 'package:student_app/utils/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const StudentApp());
}
