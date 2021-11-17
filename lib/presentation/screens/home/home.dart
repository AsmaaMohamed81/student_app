// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';
import 'package:student_app/business_logic/home/home_cubit.dart';
import 'package:student_app/data/models/student_dashboard.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/screens/home/material_item.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:student_app/utils/preferences_formatter.dart';
import 'package:student_app/utils/strings.dart';

import 'dail_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   BlocProvider.of<MaterialCubit>(context).getStudentMatrial(courseId: '471');
  // }

  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: mainAppColor,
            elevation: 0,
            leading: GestureDetector(
                // onTap: () => keyScafold.currentState!.openDrawer(),
                child: const Icon(
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
          ),
          body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is GetStudentInfo) {}
            },
            builder: (context, state) {
              return _buildBodyItem(state);
            },
          ),
        ),
      ),
    );
  }

  _buildBodyItem(state) {
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
            !BlocProvider.of<HomeCubit>(context).isLoading
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: mainAppColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: homeBackgroundCard,
                                radius: 45.r,
                                child: ClipOval(
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf59ssg3okpL3Y5jOaEZDuZsA5-cJgSzc56A&usqp=CAU",
                                    height: 80.h,
                                    width: 80.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Row(children: [
                                    Text(
                                      "Hi,",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                    Text(
                                      state.studentInformation.name.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(children: [
                                    Text(
                                      "Class A  ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                    Text(
                                      "|  ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                    Text(
                                      "Level KG",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 2.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: homeBackgroundCard,
                                    ),
                                    child: Text(
                                      "2020-2021",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 270.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("#00000029").withOpacity(0.5),
                                  blurRadius: 6,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      Text(
                                        "Lectures",
                                        style: TextStyle(
                                            color: HexColor("#5C4DB1"),
                                            fontSize: 10.sp),
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
                                      Text(
                                        "Missed Lectures",
                                        style: TextStyle(
                                            color: HexColor("#5C4DB1"),
                                            fontSize: 10.sp),
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
                                      Text(
                                        "Daily Lecture",
                                        style: TextStyle(
                                            color: HexColor("#5C4DB1"),
                                            fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                        height: 170.h,
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: HexColor('#F8FAFC'),
                                            border: Border.all(
                                                color: HexColor("#CFE1FB"))),
                                        child: ListView.builder(
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            if (state is GetStudentMaterail) {
                                              return MaterialItem(
                                                studentMaterial: state
                                                    .studentDashboard
                                                    .subjects![index],
                                              );
                                            } else {
                                              return Text("SDs");
                                            }
                                          },
                                        )),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: HexColor('#F8FAFC')
                                              .withOpacity(.9),
                                        ))
                                  ]),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(color: mainAppColor),
                  ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return DailyItem();
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(AppLocalizations.of(context)!.translate("home")!),
            DefaultButton(
              borderColor: mainAppColor,
              btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
              btnColor: Colors.white,
              btnLbl: AppLocalizations.of(context)!.translate("log_out")!,
              onPressedFunction: () {
                SharedPreferencesFormatter.remove("user");

                Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute, (Route<dynamic> route) => false);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  borderColor: mainAppColor,
                  btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
                  btnColor: Colors.white,
                  btnLbl: AppLocalizations.of(context)!.translate("arabic")!,
                  onPressedFunction: () =>
                      BlocProvider.of<LocaleCubit>(context).toArabic(),
                ),
                DefaultButton(
                  borderColor: mainAppColor,
                  btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
                  btnColor: Colors.white,
                  btnLbl: AppLocalizations.of(context)!.translate("english")!,
                  onPressedFunction: () =>
                      BlocProvider.of<LocaleCubit>(context).toEnglish(),
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
