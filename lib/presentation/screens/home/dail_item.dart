import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class DailyItem extends StatelessWidget {
  const DailyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: HexColor("#FFF7D6"),
              border: Border.all(color: mainAppColor, width: .5)),
          height: 100.h,
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 5.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomRight: Radius.circular(3)),
                      color: HexColor("#2DE6EA"),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Math",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Fri 20/10",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: HexColor("#34B208"),
                ),
                child: Text(
                  "10:00 AM",
                  style: TextStyle(fontSize: 10.sp, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
            color: HexColor("#FFF7D6"),
            margin: const EdgeInsets.fromLTRB(10, 0, 40, 0),
            child: Text(
              "Assignment",
              style: TextStyle(fontSize: 10.sp),
            ))
      ],
    );
  }
}
