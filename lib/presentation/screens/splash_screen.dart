import 'package:flutter/material.dart';
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
  
  Future initData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Widget _buildBodyItem() {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: orientation == Orientation.portrait
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              orientation == Orientation.portrait
                  ? SizedBox(
                      height: 100.h,
                    )
                  : SizedBox(
                      height: 10.h,
                    ),
              Image.asset(
                'assets/images/logo.png',
                height: orientation == Orientation.portrait ? 0.5.sh : .5.sh,
              ),
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
                            text: 'Talentnotion',
                            style: TextStyle(
                                fontSize: 20.sp, color: HexColor('0F0A39')),
                            children: <InlineSpan>[
                              TextSpan(
                                text: '2021',
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.brown),
                              )
                            ])),
                        SizedBox(
                          width: 12.w,
                        ),
                        const Icon(Icons.copyright)
                      ])),
            ],
          ),
        ],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initData().then((value) =>
      _checkShowingIntro());
  }

  Future<void> _checkShowingIntro() async {
    bool showIntro = await SharedPreferencesFormatter.getBoolean("show_intro", true);
    if (showIntro) {
      SharedPreferencesFormatter.saveBoolean("show_intro",false);
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
