
import 'package:flutter/material.dart';
import 'package:student_app/utils/app_colors.dart';






class PageContainer extends StatelessWidget {
  final Widget child;
   const PageContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color:  mainAppColor,
        child: SafeArea(
          child: GestureDetector(
            onTap: () =>
              FocusScope.of(context).requestFocus( FocusNode())
            ,
            child: child,
          ),
        ));
  }
}
