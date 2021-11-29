import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:student_app/utils/strings.dart';

import 'widgets/animated_btn.dart';

class ChoosingLoginOrSignUpLandscape extends StatefulWidget {
  const ChoosingLoginOrSignUpLandscape({Key? key}) : super(key: key);

  @override
  State<ChoosingLoginOrSignUpLandscape> createState() =>
      _ChoosingLoginOrSignUpLandscapeState();
}

class _ChoosingLoginOrSignUpLandscapeState
    extends State<ChoosingLoginOrSignUpLandscape>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Widget _buildBodyItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90.h,
          ),
          Text(
            AppLocalizations.of(context)!.translate('welcome')!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 50.sp,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppLocalizations.of(context)!.translate('app_name')! +
                ' , ' +
                AppLocalizations.of(context)!.translate('place_you_learn')!,
            style: TextStyle(color: HexColor('7B7890'), fontSize: 30.sp),
          ),
          Row(
            children: [
              SizedBox(
            height: 150.h,
            width: 0.5.sw,
           
            child:ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    var animation = Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _animationController!,
                        curve: Interval((1 / 2) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    _animationController?.forward();
                    return  AnimatedBtn(
                        defaultButton: index == 0
                            ? DefaultButton(
                                width: 0.4.sw,
                                height: 60.h,
                                borderColor: mainAppColor,
                                horizontalMarginIsEnabled: false,
                                btnLblStyle: TextStyle(
                                    color: mainAppColor,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold),
                                btnColor: Colors.white,
                                btnLbl: AppLocalizations.of(context)!
                                    .translate('sign_in')!,
                                onPressedFunction: () =>
                                    Navigator.pushNamed(context, loginRoute),
                              )
                            : DefaultButton(
                                height: 60.h,
                                borderColor: mainAppColor,
                                horizontalMarginIsEnabled: false,
                                btnLblStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold),
                                btnLbl: AppLocalizations.of(context)!
                                    .translate('sign_up')!,
                                onPressedFunction: () =>
                                    Navigator.pushNamed(context, signUpRoute),
                              ),
                        animation: animation,
                        animationController: _animationController,
                      
                    );
                  })),
              Image.asset(
                'assets/images/welcome_bg.png',
                width: 0.35.sw,
                // fit: BoxFit.fill,
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 120.w,
              child: Divider(
                indent: 2,
                thickness: 4,
                height: 10.h,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyItem(context);
  }
}
