import 'package:flutter/material.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'choosing_login_or_sign_up_landscape.dart';
import 'choosing_login_or_sign_up_portrait.dart';

class ChoosingLoginOrSignUpScreen extends StatelessWidget {
  const ChoosingLoginOrSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? const ChoosingLoginOrSignUpPortrait()
            : const ChoosingLoginOrSignUpLandscape();
      })),
    );
  }
}
