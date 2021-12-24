import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/home/home_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/screens/home/widgets/subject_item.dart';
import 'package:student_app/presentation/screens/home/widgets/assignment_slider.dart';
import 'package:student_app/presentation/screens/home/widgets/daily_lecture_slider.dart';
import 'package:student_app/presentation/screens/home/widgets/exam_slider.dart';
import 'package:student_app/presentation/widgets/app_drawer/app_drawer.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:student_app/utils/strings.dart';

class HomeScreenPortrait extends StatefulWidget {
  final int? studentId;
  const HomeScreenPortrait({Key? key, required this.studentId})
      : super(key: key);

  @override
  _HomeScreenPortraitState createState() => _HomeScreenPortraitState();
}

class _HomeScreenPortraitState extends State<HomeScreenPortrait> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context)
        .getStudentDashboard(studentId: '${widget.studentId}');
  }

  Widget _buildBodyItem(StudentDashboardSuccess state) {
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
                              child: CachedNetworkImage(
                                imageUrl: state.studentDashboard
                                            .studentInformation!.photo !=
                                        null
                                    ? state.studentDashboard.studentInformation!
                                        .photo
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
                                          color: Colors.white, fontSize: 11.sp),
                                    ),
                                    Text(
                                      "  |  ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11.sp),
                                    ),
                                    Text(
                                      "${state.studentDashboard.studentInformation!.levelName!}  ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11.sp),
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, missedLecturesScreen);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: HexColor("#EDFDFF"),
                                    radius: 40.r,
                                    child: Image.asset(
                                      "assets/images/calendar.png",
                                      height: 75.h,
                                      width: 75.h,
                                      fit: BoxFit.cover,
                                    ),
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, missedLecturesScreen);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: HexColor("#FFF7D6"),
                                    radius: 40.r,
                                    child: Image.asset(
                                      "assets/images/schedule.png",
                                      height: 45.h,
                                      width: 45.h,
                                      fit: BoxFit.cover,
                                    ),
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
                                  return SubjectsItem(
                                    subject:
                                        state.studentDashboard.subjects![index],
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
                DailyLectureSlider(studentDashboardState: state),
                AssignmentSlider(studentDashboardState: state),
                ExamSlider(studentDashboardState: state),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Padding(
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
        child: Text(AppLocalizations.of(context)!.translate('home')!),
      ),
      backgroundColor: mainAppColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          )),
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
            appBar: appBar,
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(color: mainAppColor),
                  );
                } else if (state is StudentDashboardSuccess) {
                  return _buildBodyItem(state);
                } else if (state is StudentDashboardFailure) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text("$state"));
              },
            )),
      ),
    );
  }
}
