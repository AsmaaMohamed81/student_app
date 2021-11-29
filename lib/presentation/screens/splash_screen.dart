import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/animation/slide_in.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/utils/preferences_formatter.dart';
import 'package:student_app/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _startMovingUp = false;
  Future initData() async => await Future.delayed(const Duration(seconds: 3));

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 600),
        () => setState(() => _startMovingUp = true));
    initData().then((value) => _checkShowingIntro());
  }

  Widget _buildBodyItem() {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final centerHeight = MediaQuery.of(context).size.height / 2 - topPadding;
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/images/splash_bg.png',
                height: orientation == Orientation.portrait ? 0.25.sh : .9.sh,
                width: orientation == Orientation.portrait ? .9.sw : .9.sw,
                fit: BoxFit.fill,
              )),
          AnimatedPadding(
              padding: EdgeInsets.only(
                top: _startMovingUp ? 20 : centerHeight,
              ),
              duration: const Duration(seconds: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: orientation == Orientation.portrait
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  orientation == Orientation.portrait
                      ? SizedBox(
                          height: 20.h,
                        )
                      : const SizedBox(),
                  SlideIn(
                      msDelay: 500,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: orientation == Orientation.portrait
                            ? 0.4.sh
                            : 0.43.sh,
                      )),
                  orientation == Orientation.portrait
                      ? SizedBox(
                          height: 20.h,
                        )
                      : const SizedBox(),
                  Align(
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(
                                text: AppLocalizations.of(context)!
                                    .translate('app_name')!,
                                style: TextStyle(
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? 20.sp
                                            : 30.sp,
                                    color: HexColor('0F0A39'),
                                    fontWeight: FontWeight.bold),
                                children: <InlineSpan>[
                                  const TextSpan(text: '  '),
                                  TextSpan(
                                    text: DateTime.now().year.toString(),
                                    style: TextStyle(
                                        fontSize:
                                            orientation == Orientation.portrait
                                                ? 20.sp
                                                : 30.sp,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                            SizedBox(
                              width: orientation == Orientation.portrait
                                  ? 12.w
                                  : 5.w,
                            ),
                            Icon(
                              Icons.copyright,
                              size: orientation == Orientation.portrait
                                  ? 20.sp
                                  : 35.sp,
                            )
                          ])),
                ],
              )),
        ],
      );
    });
  }

  Future<void> _checkShowingIntro() async {
    bool showIntro =
        await SharedPreferencesFormatter.getBoolean("show_intro", true);
    if (showIntro) {
      SharedPreferencesFormatter.saveBoolean("show_intro", false);
      Navigator.pushReplacementNamed(context, introRoute);
    } else {
      Navigator.pushReplacementNamed(context, homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        child: Scaffold(
      body: _buildBodyItem(),
    ));
  }
}
