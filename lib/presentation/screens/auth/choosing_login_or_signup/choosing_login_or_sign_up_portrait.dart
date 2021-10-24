import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class ChoosingLoginOrSignUpPortrait extends StatelessWidget {
  const ChoosingLoginOrSignUpPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBodyItem(context);
  }
  Widget _buildBodyItem(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/welcome_bg.png',
              width: 1.sw,
              fit: BoxFit.fill,
            )),
        Container(
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
                  fontSize: 30.sp,
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
                style: TextStyle(color: HexColor('7B7890'), fontSize: 18.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              DefaultButton(
                borderColor: mainAppColor,
                horizontalMarginIsEnabled: false,
                btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
                btnColor: Colors.white,
                btnLbl: AppLocalizations.of(context)!.translate('sign_in')!,
                onPressedFunction: () {},
              ),
              DefaultButton(
                borderColor: mainAppColor,
                horizontalMarginIsEnabled: false,
                btnLbl: AppLocalizations.of(context)!.translate('sign_up')!,
                onPressedFunction: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
