import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Image.asset('assets/images/logo.png', height: 370.h),
        Align(
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text.rich(TextSpan(
                  text: 'Talentnotion',
                  style: TextStyle(fontSize: 20.sp, color: HexColor('0F0A39')),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '2021',
                      style: TextStyle(fontSize: 20.sp, color: Colors.brown),
                    )
                  ])),
              SizedBox(
                width: 12.w,
              ),
              const Icon(Icons.copyright)
            ])),
        Image.asset(
          'assets/images/splash_bg.png',
          width: 1.sw,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // initData().then((value) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const MainView()));
    // });
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyItem(),
    );
  }
}
