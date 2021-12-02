import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/data/models/student_dashboard.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class SubjectsItemlandscape extends StatelessWidget {
  final Subject subject;

  const SubjectsItemlandscape({Key? key, required this.subject})
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
                height: 70.h,
                width: 3.w,
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
                        fontSize: 30.sp,
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
                              fontSize: 25.sp, color: HexColor("#7B7890")),
                        )
                      : const SizedBox()
                ],
              ),
              const Spacer(),
              _buildPopupMenu(context)
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

  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton(
        child: const Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 35,
        ),
        onSelected: (value) {
          switch (value) {
            case "Delete":
              break;
            case 'Edit':
              break;
          }
        },
        itemBuilder: (context) {
          // ignore: deprecated_member_use
          var menuList = <PopupMenuEntry<Object>>[];
          menuList.add(
            PopupMenuItem(
              value: 'Content',
              height: 30,
              child: Text(
                "Content",
                style: TextStyle(
                    color: mainAppColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          );

          menuList.add(
            PopupMenuItem(
              value: 'Assignments',
              height: 30,
              child: Text(
                "Assignments",
                style: TextStyle(
                    color: mainAppColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          );

          menuList.add(
            PopupMenuItem(
              value: 'Exams',
              height: 30,
              child: Text(
                "Exams",
                style: TextStyle(
                    color: mainAppColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          );

          return menuList;
        });
  }
}
