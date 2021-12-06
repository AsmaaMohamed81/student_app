import 'package:flutter/material.dart';
import 'package:student_app/presentation/screens/home/home_landscape.dart';
import 'package:student_app/presentation/screens/home/home_portrait.dart';
import 'package:student_app/presentation/widgets/page_container.dart';

class Home extends StatelessWidget {
  final int? studentId;
  const Home({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? HomePortrait(
                studentId: studentId,
              )
            : HomeLandscape(
                studentId: studentId,
              );
      })
      )
      ,
    );
  }
}
