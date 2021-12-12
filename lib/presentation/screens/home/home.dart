import 'package:flutter/material.dart';
import 'package:student_app/presentation/screens/home/home_landscape.dart';
import 'package:student_app/presentation/screens/home/home_portrait.dart';
import 'package:student_app/presentation/widgets/page_container.dart';

class HomeScreen extends StatelessWidget {
  final int? studentId;
  const HomeScreen({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? HomeScreenPortrait(
                studentId: studentId,
              )
            : HomeScreenLandscape(
                studentId: studentId,
              );
      })),
    );
  }
}
