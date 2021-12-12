import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/home/home_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:intl/intl.dart';

class AssignmentSlider extends StatelessWidget {
  final StudentDashboardSuccess studentDashboardState;
  const AssignmentSlider({Key? key, required this.studentDashboardState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentDot = 0;
    final CarouselController _carouselController = CarouselController();
    final List<Widget> assignmentSliders = studentDashboardState
        .studentDashboard.assignments!
        .map((assignment) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              assignment.assignmentComeSoon == false
                  ? assignment.assignmentFinished == true
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/images/comesoon.png",
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 25.h
                                : 70.h,
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 25.h
                                : 70.h,
                            fit: BoxFit.fill,
                          ))
                  : Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "assets/images/comesoon.png",
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 25.h
                            : 70.h,
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 25.h
                            : 70.h,
                        fit: BoxFit.fill,
                      )),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 30.h
                        : 70.h,
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 5.h
                        : 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.r),
                        bottomRight: Radius.circular(3.r),
                      ),
                      color: assignment.subjectColor != null
                          ? HexColor("${assignment.subjectColor}")
                          : HexColor("#8B0000"),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        assignment.materialName.toString(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 15.sp
                                : 40.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#0F0A39")),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        DateFormat('EEE dd/MM/yyyy')
                            .format(assignment.assignmentDueDate!),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 10.sp
                                : 30.sp,
                            color: HexColor("#0F0A39")),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                alignment: Alignment.center,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 20.h
                        : 40.h,
                width: 0.13.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: assignment.subjectColor != null
                      ? HexColor("${assignment.subjectColor}")
                      : HexColor("#8B0000"),
                ),
                child: Text(
                  DateFormat('kk:mm a').format(assignment.assignmentDueDate!),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.sp
                          : 30.sp,
                      color: Colors.white),
                ),
              ),
            ]))
        .toList();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
                topRight: Radius.circular(5.r),
                bottomLeft: Radius.circular(5.r),
              ),
              color: HexColor("#FFF7D6"),
              border: Border.all(color: mainAppColor, width: .5)),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 110.h
              : 300.h,
          width: 100.w,
          child: Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 90.h
                        : 250.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      _currentDot = index;
                    }),
                items: assignmentSliders,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: studentDashboardState.studentDashboard.assignments!
                      .asMap()
                      .entries
                      .map(
                    (entry) {
                      return GestureDetector(
                        onTap: () =>
                            _carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 7.0.w,
                          height: 7.0.h,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _currentDot == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    },
                  ).toList()),
            ],
          ),
        ),
        Container(
            color: HexColor("#FFF7D6"),
            margin: EdgeInsets.fromLTRB(10.w, 0, 40.w, 0),
            child: Text(
              AppLocalizations.of(context)!.translate("assignment")!,
              style: TextStyle(
                fontSize:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 10.h
                        : 30.h,
              ),
            ))
      ],
    );
  }
}
