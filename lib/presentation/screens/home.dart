import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:student_app/utils/preferences_formatter.dart';
import 'package:student_app/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainAppColor2,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: mainAppColor2,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: homeBackgroundCard,
                          radius: 47.r,
                          child: ClipOval(
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf59ssg3okpL3Y5jOaEZDuZsA5-cJgSzc56A&usqp=CAU",
                              height: 90.h,
                              width: 90.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(children: const [
                              Text("Hi,"),
                              Text("Mohamed Hany"),
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
                              child: Text("2020-2021"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
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
                                  backgroundColor: homeBackgroundCard,
                                  radius: 47.r,
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf59ssg3okpL3Y5jOaEZDuZsA5-cJgSzc56A&usqp=CAU",
                                      height: 90.h,
                                      width: 90.h,
                                      fit: BoxFit.cover,
                                    ),
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
                                  backgroundColor: homeBackgroundCard,
                                  radius: 47.r,
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf59ssg3okpL3Y5jOaEZDuZsA5-cJgSzc56A&usqp=CAU",
                                      height: 90.h,
                                      width: 90.h,
                                      fit: BoxFit.cover,
                                    ),
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
                                  backgroundColor: homeBackgroundCard,
                                  radius: 47.r,
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf59ssg3okpL3Y5jOaEZDuZsA5-cJgSzc56A&usqp=CAU",
                                      height: 90.h,
                                      width: 90.h,
                                      fit: BoxFit.cover,
                                    ),
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: HexColor('#F8FAFC'),
                              border: Border.all(color: HexColor("#CFE1FB"))),
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Text("adss");
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
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
    );
  }
}
