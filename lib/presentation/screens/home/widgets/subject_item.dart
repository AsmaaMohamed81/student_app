import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/data/models/student_dashboard.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class SubjectsItem extends StatelessWidget {
  final Subject subject;

  const SubjectsItem({Key? key, required this.subject}) : super(key: key);
  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton(
        child: Icon(
          Icons.more_vert,
          color: Colors.black,
          size: MediaQuery.of(context).orientation == Orientation.portrait
              ? 20.h
              : 70.h,
        ),
        onSelected: (value) {
          switch (value) {
            case "content":
              break;
            case 'assignments':
              break;
            case 'exams':
              break;
          }
        },
        itemBuilder: (context) {
          // ignore: deprecated_member_use
          var menuList = <PopupMenuEntry<Object>>[];
          menuList.add(
            PopupMenuItem(
              value: 'content',
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 30.h
                  : 50.h,
              child: Text(
                AppLocalizations.of(context)!.translate('content')!,
                style: TextStyle(
                    color: mainAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 15.sp
                        : 25.sp),
              ),
            ),
          );

          menuList.add(
            PopupMenuItem(
              value: 'assignments',
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 30.h
                  : 50.h,
              child: Text(
                AppLocalizations.of(context)!.translate('assignment')!,
                style: TextStyle(
                    color: mainAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 15.sp
                        : 25.sp),
              ),
            ),
          );

          menuList.add(
            PopupMenuItem(
              value: 'exams',
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 30.h
                  : 50.h,
              child: Text(
                AppLocalizations.of(context)!.translate('exams')!,
                style: TextStyle(
                    color: mainAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 15.sp
                        : 25.sp),
              ),
            ),
          );

          return menuList;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 30.h
                        : 80.h,
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
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 17.sp
                            : 35.sp,
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
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 12.sp
                                  : 25.sp,
                              color: HexColor("#7B7890")),
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
}
