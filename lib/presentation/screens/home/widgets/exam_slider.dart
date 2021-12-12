import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/home/home_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:intl/intl.dart';

class ExamSlider extends StatelessWidget {
  final StudentDashboardSuccess studentDashboardState;

  const ExamSlider({Key? key, required this.studentDashboardState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentDot = 0;
    final CarouselController _carouselController = CarouselController();
    final List<Widget> examstSliders = studentDashboardState
        .studentDashboard.exams!
        .map((exam) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              exam.examComeSoon == false
                  ? exam.examFinished == true
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
                          bottomRight: Radius.circular(3.r)),
                      color: exam.subjectColor != null
                          ? HexColor("${exam.subjectColor}")
                          : HexColor("#00C3DE"),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        exam.courseName.toString(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 15.sp
                                : 40.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        DateFormat('EEE dd/MM/yyyy').format(exam.createdDate!),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 10.sp
                                : 30.sp),
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
                  color: exam.subjectColor != null
                      ? HexColor("${exam.subjectColor}")
                      : HexColor("#00C3DE"),
                ),
                child: Text(
                  DateFormat('kk:mm a').format(exam.createdDate!),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.h
                          : 30.h,
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
              color: HexColor("#C7E1FB"),
              border: Border.all(color: mainAppColor, width: .5.w)),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 110.h
              : 300.h,
          width: 100.w,
          child: Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 90.h
                        : 250.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  items: examstSliders),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: studentDashboardState.studentDashboard.exams!
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
                          margin: EdgeInsets.symmetric(horizontal: 4.0.w),
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
            color: HexColor("#C7E1FB"),
            margin: const EdgeInsets.fromLTRB(10, 0, 40, 0),
            child: Text(
              AppLocalizations.of(context)!.translate("exams")!,
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
