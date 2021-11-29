import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/data/models/student_dashboard.dart';
import 'package:student_app/utils/hex_color.dart';

class SubjectsItem extends StatelessWidget {
  final Subject subject;

  const SubjectsItem({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30.h,
                width: 5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor("#FFCC0A"),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.subjectName.toString(),
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  subject.groupName != null
                      ? Text(
                          "(${subject.groupName})",
                          style: const TextStyle(fontSize: 10),
                        )
                      : const SizedBox()
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
