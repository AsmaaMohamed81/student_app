import 'package:flutter/material.dart';
import 'package:student_app/utils/app_colors.dart';

class NoData extends StatelessWidget {
  final String message;
  const NoData({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.not_interested,
          size: 60,
          color: mainAppColor,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            message,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
      ],
    ));
  }
}
