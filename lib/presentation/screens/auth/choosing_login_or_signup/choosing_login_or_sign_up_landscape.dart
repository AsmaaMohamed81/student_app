import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class ChoosingLoginOrSignUpLandscape extends StatelessWidget {
  const ChoosingLoginOrSignUpLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBodyItem(context);
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
              Expanded(
                child: Column(children: [
                  SizedBox(
                    width: 0.4.sw,
                    child: DefaultButton(
                      height: 60.h,
                      borderColor: mainAppColor,
                      horizontalMarginIsEnabled: false,
                      btnLblStyle:
                          TextStyle(color: mainAppColor, fontSize: 25.sp),
                      btnColor: Colors.white,
                      btnLbl:
                          AppLocalizations.of(context)!.translate('sign_in')!,
                      onPressedFunction: () => Navigator.pushNamed(context,  '/login'),
                    ),
                  ),
                  SizedBox(
                      width: 0.4.sw,
                      child: DefaultButton(
                        height: 60.h,
                        borderColor: mainAppColor,
                        horizontalMarginIsEnabled: false,
                        btnLblStyle: TextStyle(color: Colors.white, fontSize: 25.sp),
                        btnLbl:
                            AppLocalizations.of(context)!.translate('sign_up')!,
                        onPressedFunction: () {},
                      ))
                ]),
              ),
              Image.asset(
                'assets/images/welcome_bg.png',
                width: 0.3.sw,
                // fit: BoxFit.fill,
              ),
            ],
          )
        ],
      ),
    );
  }
}
