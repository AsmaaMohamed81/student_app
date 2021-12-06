import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/home/home_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/screens/home/subject_item_portrait.dart';
import 'package:student_app/presentation/widgets/app_drawer/app_drawer.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:intl/intl.dart';

class HomePortrait extends StatefulWidget {
  final int? studentId;
  const HomePortrait({Key? key, required this.studentId}) : super(key: key);

  @override
  _HomePortraitState createState() => _HomePortraitState();
}

class _HomePortraitState extends State<HomePortrait> {
  int _currentDot = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context)
        .getStudentDashboard(studentId: '${widget.studentId}');
  }

  @override
  Widget build(BuildContext context) {
    final appBar =  AppBar(
            title: Padding(
              padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
              child: Text(AppLocalizations.of(context)!.translate('home')!),
            ),
            backgroundColor: mainAppColor,
            elevation: 0,
            leading:IconButton(
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ))
,
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          );
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const AppDrawer(),
          resizeToAvoidBottomInset: false,
          appBar:appBar,
          body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return _buildBodyItem(state);
            },
          ),
        ),
      ),
    );
  }

  _buildBodyItem(HomeState state) {
    if (state is HomeLoadingState) {
      return Center(
        child: CircularProgressIndicator(color: mainAppColor),
      );
    } else if (state is StudentDashboardSuccess) {
      return Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(
          "assets/images/backhome.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)),
                  color: mainAppColor,
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 10.h),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: homeBackgroundCard,
                              radius: 45.r,
                              child: ClipOval(
                                child: Image.network(
                                  state.studentDashboard.studentInformation!
                                              .photo !=
                                          null
                                      ? state.studentDashboard
                                          .studentInformation!.photo
                                          .toString()
                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf59ssg3okpL3Y5jOaEZDuZsA5-cJgSzc56A&usqp=CAU",
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Column(
                              children: [
                                Row(children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('hi')!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                  Text(
                                    state.studentDashboard.studentInformation!
                                        .name!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                ]),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${state.studentDashboard.studentInformation!.className!}   ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp),
                                      ),
                                      Text(
                                        "  |  ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp),
                                      ),
                                      Text(
                                        "${state.studentDashboard.studentInformation!.levelName!}  ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: homeBackgroundCard,
                                  ),
                                  child: Text(
                                    "${state.studentDashboard.studentInformation!.academicYearName}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 40.h, 0, 0),
                        height: 280.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: HexColor("#00000029").withOpacity(0.5),
                              blurRadius: 6.r,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: HexColor("#FFF7D6"),
                                    radius: 40.r,
                                    child: Image.asset(
                                      "assets/images/flame_training.png",
                                      height: 65.h,
                                      width: 65.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('lectures')!,
                                    style: TextStyle(
                                        color: HexColor("#5C4DB1"),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: HexColor("#EDFDFF"),
                                    radius: 40.r,
                                    child: Image.asset(
                                      "assets/images/calendar.png",
                                      height: 75.h,
                                      width: 75.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate("missed_lectures")!,
                                    style: TextStyle(
                                        color: HexColor("#5C4DB1"),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: HexColor("#FFF7D6"),
                                    radius: 40.r,
                                    child: Image.asset(
                                      "assets/images/schedule.png",
                                      height: 45.h,
                                      width: 45.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate("daily_lecture")!,
                                    style: TextStyle(
                                        color: HexColor("#5C4DB1"),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Container(
                                height: 190.h,
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                padding:
                                    EdgeInsets.fromLTRB(20.h, 10.w, 20.h, 20.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: HexColor('#F8FAFC'),
                                    border:
                                        Border.all(color: HexColor("#CFE1FB"))),
                                child: ListView.builder(
                                  itemCount:
                                      state.studentDashboard.subjects!.length,
                                  itemBuilder: (context, index) {
                                    return SubjectsItemPortrait(
                                      subject: state
                                          .studentDashboard.subjects![index],
                                    );
                                  },
                                )),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: HexColor('#F8FAFC').withOpacity(.9),
                                ))
                          ]),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  _buildDailyLectureCarouselSlider(state),
                  _buildAssignmentCarouselSlider(state),
                  _buildExamsCarouselSlider(state),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ]);
    } else if (state is StudentDashboardFailure) {
      return Center(child: Text(state.message));
    }
  }

  _buildAssignmentCarouselSlider(StudentDashboardSuccess state) {
    final List<Widget> assignmentSliders = state.studentDashboard.assignments!
        .map((assignment) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              assignment.assignmentComeSoon == false
                  ? assignment.assignmentFinished == true
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/images/comesoon.png",
                            height: 25.h,
                            width: 25.h,
                            fit: BoxFit.fill,
                          ))
                  : Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "assets/images/comesoon.png",
                        height: 25.h,
                        width: 25.h,
                        fit: BoxFit.fill,
                      )),
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 5.w,
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
                            fontSize: 15.sp,
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
                            fontSize: 10.sp, color: HexColor("#0F0A39")),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: assignment.subjectColor != null
                      ? HexColor("${assignment.subjectColor}")
                      : HexColor("#8B0000"),
                ),
                child: Text(
                  DateFormat('kk:mm a').format(assignment.assignmentDueDate!),
                  style: TextStyle(fontSize: 10.sp, color: Colors.white),
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
          height: 110.h,
          width: 100.w,
          child: Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                    height: 90.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentDot = index;
                      });
                    }),
                items: assignmentSliders,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      state.studentDashboard.assignments!.asMap().entries.map(
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
              style: TextStyle(fontSize: 10.sp),
            ))
      ],
    );
  }

  _buildDailyLectureCarouselSlider(StudentDashboardSuccess state) {
    final List<Widget> examstSliders = state.studentDashboard.dailyLectures!
        .map((dailyLectures) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 25.h,
                    child: Image.network(
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
                            ? AppLocalizations.of(context)!.translate("break")!
                            : dailyLectures.subjectName.toString(),
                        style: TextStyle(
                            fontSize: 15.sp,
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
                    style:
                        TextStyle(fontSize: 10.sp, color: HexColor('#01064E')),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 20.h,
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
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
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
          height: 110.h,
          width: 100.w,
          child: Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    height: 90.0.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  items: examstSliders),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      state.studentDashboard.dailyLectures!.asMap().entries.map(
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
            color: HexColor("#EFF7FF"),
            margin: EdgeInsets.fromLTRB(10.w, 0, 40.w, 0),
            child: Text(
              AppLocalizations.of(context)!.translate("daily_lecture")!,
              style: TextStyle(fontSize: 10.sp),
            ))
      ],
    );
  }

  _buildExamsCarouselSlider(StudentDashboardSuccess state) {
    final List<Widget> examstSliders = state.studentDashboard.exams!
        .map((exam) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              exam.examComeSoon == false
                  ? exam.examFinished == true
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/images/comesoon.png",
                            height: 25.h,
                            width: 25.h,
                            fit: BoxFit.fill,
                          ))
                  : Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "assets/images/comesoon.png",
                        height: 25.h,
                        width: 25.h,
                        fit: BoxFit.fill,
                      )),
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 5.w,
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
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        DateFormat('EEE dd/MM/yyyy').format(exam.createdDate!),
                        style: TextStyle(fontSize: 10.sp),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: exam.subjectColor != null
                      ? HexColor("${exam.subjectColor}")
                      : HexColor("#00C3DE"),
                ),
                child: Text(
                  DateFormat('kk:mm a').format(exam.createdDate!),
                  style: TextStyle(fontSize: 10.sp, color: Colors.white),
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
          height: 110.h,
          width: 100.w,
          child: Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    height: 90.0.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  items: examstSliders),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.studentDashboard.exams!.asMap().entries.map(
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
              style: TextStyle(fontSize: 10.sp),
            ))
      ],
    );
  }
}
