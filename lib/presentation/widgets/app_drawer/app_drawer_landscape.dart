import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/login/login_cubit.dart';
import 'dart:math' as math;
import 'package:student_app/locale/app_localizations.dart';

class AppDrawerLandscape extends StatelessWidget {
  const AppDrawerLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: SizedBox(
          width: 1.sw,
          child: Drawer(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff490AC1),
                    Color(0xff2481D7),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 20.h,
                      right: 5.w,
                      child: IconButton(
                          icon: Image.asset('assets/images/close.png'),
                          onPressed: () => Navigator.pop(context))),
                  Positioned(
                      left: -0.3.sw,
                      child: Transform.rotate(
                          angle: math.pi / 2,
                          child: Container(
                            width: 1.sh,
                            height: 1.sh,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFe0f2f1)),
                          ))),
                  Positioned(
                    top: 0.2.sh,
                    left: -45.w,
                    child: Image.asset(
                      'assets/images/profile_picture.png',
                      height: 300.h,
                    ),
                  ),
                  Positioned(
                    top: 90.h,
                    left: 30.w,
                    height: 90.h,
                    width: 90.h,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            child: Container(
                              height: 70.h,
                              width: 70.h,
                              decoration: const BoxDecoration(
                                color: Color(0xff462BC3),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Image.asset(
                                      'assets/images/notification.png')),
                            )),
                        Positioned(
                            top: 0,
                            right: 10,
                            child: Badge(
                              borderSide: const BorderSide(
                                  color: Color(0xff462BC3), width: 1),
                              toAnimate: true,
                              animationType: BadgeAnimationType.slide,
                              elevation: 0,
                              shape: BadgeShape.circle,
                              badgeColor: Colors.white,
                              padding: EdgeInsets.all(10.h),
                              badgeContent: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      color: const Color(0xff462BC3),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 190.h,
                    left: 55.w,
                    height: 90.h,
                    width: 90.h,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            child: Container(
                              height: 70.h,
                              width: 70.h,
                              decoration: const BoxDecoration(
                                color: Color(0xff462BC3),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child:
                                      Image.asset('assets/images/message.png')),
                            )),
                        Positioned(
                            top: 0,
                            right: 10,
                            child: Badge(
                              borderSide: const BorderSide(
                                  color: Color(0xff462BC3), width: 1),
                              toAnimate: true,
                              animationType: BadgeAnimationType.slide,
                              elevation: 0,
                              shape: BadgeShape.circle,
                              badgeColor: Colors.white,
                              padding: EdgeInsets.all(10.h),
                              badgeContent: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      color: const Color(0xff462BC3),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 340.h,
                    left: 60.w,
                    child: Container(
                      height: 70.h,
                      width: 70.h,
                      decoration: const BoxDecoration(
                        color: Color(0xff462BC3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child:
                              Image.asset('assets/images/calendar_menu.png')),
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 100.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/home.png'),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocalizations.of(context)!.translate('home')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    left: 120.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/user.png'),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocalizations.of(context)!.translate('account')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 350.h,
                    left: 125.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/headset.png'),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('live_support')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 550.h,
                    left: 125.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/setting.png'),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocalizations.of(context)!.translate('settings')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      width: 1.sw,
                      bottom: 0,
                      child: Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () => BlocProvider.of<LoginCubit>(context)
                                .logout(context),
                            child: Container(
                                width: 0.5.sw,
                                alignment: Alignment.center,
                                height: 70.h,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff2481D7),
                                      Color(0xff490AC1),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.centerLeft,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/log_out.png'),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('log_out')!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
