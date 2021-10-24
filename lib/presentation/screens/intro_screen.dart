import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/utils/hex_color.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  Widget _buildBodyItem({
    required BuildContext context,
  }) {
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: <Widget>[
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
            children: <Widget>[
              orientation == Orientation.portrait
                  ? SizedBox(
                      height: 50.h,
                    )
                  : SizedBox(
                      height: 10.h,
                    ),
              orientation == Orientation.portrait
                  ? Image.asset(
                      'assets/images/logo.png',
                    )
                  : Image.asset(
                      'assets/images/logo.png',
                      height: 400.h,
                    ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  AppLocalizations.of(context)!.translate('place_you_learn')!,
                  style: TextStyle(
                      color: HexColor("00557D"),
                      fontSize:
                          orientation == Orientation.portrait ? 16.sp : 30.sp,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: orientation == Orientation.portrait ? 55.h : 80.h,
                margin: EdgeInsets.symmetric(
                    horizontal:
                        orientation == Orientation.portrait ? 40.w : 80.w,
                    vertical: 30.h),
                child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/choosing_login_or_signup'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: HexColor('FFC844'),
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Lets Get Started!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: orientation == Orientation.portrait
                                  ? 22.sp
                                  : 35.sp),
                        ))),
              ),
            ],
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        body: _buildBodyItem(
          context: context,
        ),
      ),
    );
  }
}
