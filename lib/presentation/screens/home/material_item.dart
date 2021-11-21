import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/data/models/student_dashboard.dart';
import 'package:student_app/utils/hex_color.dart';

class MaterialItem extends StatelessWidget {
  final Subjects studentMaterial;

  const MaterialItem({Key? key, required this.studentMaterial})
      : super(key: key);

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
                  Text(studentMaterial.subjectName.toString()),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "(Group Name)",
                    style: TextStyle(fontSize: 10),
                  )
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
