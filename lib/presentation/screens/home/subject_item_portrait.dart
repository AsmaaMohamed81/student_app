import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/data/models/student_dashboard.dart';
import 'package:student_app/utils/hex_color.dart';

class SubjectsItemPortrait extends StatelessWidget {
  final Subject subject;

  const SubjectsItemPortrait({Key? key, required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30.h,
                width: 5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: subject.subjectColor != null
                      ? HexColor("${subject.subjectColor}")
                      : HexColor("#FFCC0A"),
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.subjectName.toString(),
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#0F0A39")),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  subject.groupName != null
                      ? Text(
                          "(${subject.groupName})",
                          style: TextStyle(
                              fontSize: 12.sp, color: HexColor("#7B7890")),
                        )
                      : const SizedBox()
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          Divider(
            color: HexColor("#EAE9F0"),
            thickness: 2,
          )
        ],
      ),
    );
  }
}
