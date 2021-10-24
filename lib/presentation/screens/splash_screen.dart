import 'package:flutter/material.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
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
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/splash_bg.png',
                height: orientation == Orientation.portrait ? 0.3.sh : 1.0.sh,
                width: 1.sw,
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
    initData().then((value) {
      Navigator.pushReplacementNamed(context, '/intro');
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        child: Scaffold(
      body: _buildBodyItem(),
    ));
  }
}
