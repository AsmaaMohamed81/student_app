import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/home/home_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class DailyLectureSlider extends StatelessWidget {
  final StudentDashboardSuccess studentDashboardState;

  const DailyLectureSlider({Key? key, required this.studentDashboardState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentDot = 0;
    final CarouselController _carouselController = CarouselController();
    final List<Widget> dailyLecturetSliders = studentDashboardState
        .studentDashboard.dailyLectures!
        .map((dailyLectures) => dailyLectures.isBreakTime!
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate("break")!,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 15.sp
                                : 40.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#01064E")),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 20.h
                            : 40.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: dailyLectures.subjectColor != null
                              ? HexColor("${dailyLectures.subjectColor}")
                              : HexColor("#8B0000"),
                        ),
                        child: Text(
                          dailyLectures.fromTime!,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 10.h
                                  : 35.h,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/coffee_break.png",
                    height: 50.h,
                    width: 50.w,
                  )
                ],
              )
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 25.h
                          : 70.h,
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 25.h
                          : 70.h,
                      child: CachedNetworkImage(
                          imageUrl:
                              "https://img2.arabpng.com/20180328/suq/kisspng-color-wheel-switch-computer-icons-color-5abbe67ac38b23.441536901522263674801.jpg"),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dailyLectures.isBreakTime!
                              ? AppLocalizations.of(context)!
                                  .translate("break")!
                              : dailyLectures.subjectName.toString(),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 15.sp
                                  : 40.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#01064E")),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  indent: 1,
                  thickness: 2,
                  height: 10.h,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      (dailyLectures.fromTime!),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.sp
                              : 30.sp,
                          color: HexColor('#01064E')),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 20.h
                          : 40.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: dailyLectures.subjectColor != null
                            ? HexColor("${dailyLectures.subjectColor}")
                            : HexColor("#8B0000"),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.translate("join")!,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 12.h
                                : 35.h,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ]))
        .toList();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
                topRight: Radius.circular(5.r),
                bottomLeft: Radius.circular(5.r),
              ),
              color: HexColor("#EFF7FF"),
              border: Border.all(color: mainAppColor, width: .5.w)),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 110.h
              : 300.h,
          width: 100.w,
          child: studentDashboardState.studentDashboard.dailyLectures!.isEmpty
              ? Image.asset(
                  "assets/images/weekend.png",
                  height: 40.h,
                  width: 40.h,
                )
              : Column(
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
                        items: dailyLecturetSliders),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: studentDashboardState
                            .studentDashboard.dailyLectures!
                            .asMap()
                            .entries
                            .map(
                          (entry) {
                            return GestureDetector(
                              onTap: () =>
                                  _carouselController.animateToPage(entry.key),
                              child: Container(
                                width: 4.0.w,
                                height: 4.0.h,
                                margin: EdgeInsets.symmetric(horizontal: 2.0.w),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(_currentDot == entry.key
                                            ? 0.9
                                            : 0.4)),
                              ),
                            );
                          },
                        ).toList()),
                  ],
                ),
        ),
        Container(
            color: HexColor("#EFF7FF"),
            margin: EdgeInsets.fromLTRB(10.w, 0, 40.w, 0),
            child: Text(
              AppLocalizations.of(context)!.translate("daily_lecture")!,
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
