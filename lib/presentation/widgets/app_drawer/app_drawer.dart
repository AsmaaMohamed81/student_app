import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:student_app/presentation/widgets/app_drawer/app_drawer_landscape.dart';
import 'package:student_app/presentation/widgets/app_drawer/app_drawer_portrait.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? const AppDrawerPortrait()
          : const AppDrawerLandscape();
    });
  }
}
