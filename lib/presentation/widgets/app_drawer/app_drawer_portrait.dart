import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/login/login_cubit.dart';
import 'dart:math' as math;
import 'package:student_app/locale/app_localizations.dart';

class AppDrawerPortrait extends StatelessWidget {
  const AppDrawerPortrait({Key? key}) : super(key: key);

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
                      right: 10.w,
                      child: IconButton(
                          icon: Image.asset('assets/images/close.png'),
                          onPressed: () => Navigator.pop(context))),
                  Positioned(
                      left: -1.4.sw,
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
                    top: 0.3.sh,
                    left: -105.w,
                    child: Image.asset(
                      'assets/images/profile_picture.png',
                      height: 200.h,
                    ),

                    // CachedNetworkImage(
                    //                     progressIndicatorBuilder:
                    //                         (context, url, progress) =>
                    //                             Center(
                    //                       child: CircularProgressIndicator(
                    //                           value: progress.progress,
                    //                           color: mainAppColor),
                    //                     ),
                    //                     height: 110,
                    //                     width: 100,
                    //                     fit: BoxFit.cover,
                    //                     imageUrl: user.photo!,
                    //                     errorWidget: (context, url, error) =>
                    //                         const Icon(Icons.error),
                    //                   ),
                  ),
                  Positioned(
                    top: 170.h,
                    left: 80.w,
                    height: 60.h,
                    width: 60.h,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            child: Container(
                              height: 48.h,
                              width: 48.h,
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
                              padding: EdgeInsets.all(6.h),
                              badgeContent: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xff462BC3),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 260.h,
                    left: 120.w,
                    height: 60.h,
                    width: 60.h,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            child: Container(
                              height: 48.h,
                              width: 48.h,
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
                              padding: EdgeInsets.all(6.h),
                              badgeContent: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xff462BC3),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 370.h,
                    left: 110.w,
                    child: Container(
                      height: 48.h,
                      width: 48.h,
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
                    top: 130.h,
                    left: 170.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/home.png'),
                        SizedBox(width: 15.w),
                        Text(
                          AppLocalizations.of(context)!.translate('home')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 190.h,
                    left: 200.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/user.png'),
                        SizedBox(width: 15.w),
                        Text(
                          AppLocalizations.of(context)!.translate('account')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 270.h,
                    left: 205.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/headset.png'),
                        SizedBox(width: 15.w),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('live_support')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 380.h,
                    left: 220.w,
                    child: Row(
                      children: [
                        Image.asset('assets/images/setting.png'),
                        SizedBox(width: 15.w),
                        Text(
                          AppLocalizations.of(context)!.translate('settings')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: InkWell(
                        onTap: () => BlocProvider.of<LoginCubit>(context)
                            .logout(context),
                        child: Container(
                            width: 1.sw,
                            alignment: Alignment.center,
                            height: 45.h,
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
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
