import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // String _userEmail = '', _userPassword = '';
  final _formKey = GlobalKey<FormState>();

  Widget _buildBodyItem() {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/login_bg.png',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.translate("sign_in")!,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize:
                          orientation == Orientation.portrait ? 28.sp : 50.sp),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              PredefinedTextFormField(
                hintTxt: AppLocalizations.of(context)!
                    .translate("enter_email_or_user_name")!,
              ),
              SizedBox(
                height: 15.h,
              ),
              PredefinedTextFormField(
                hintTxt:
                    AppLocalizations.of(context)!.translate("enter_password")!,
                isPassword: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('forgot_your_password')!,
                        style: TextStyle(
                            color: HexColor('7B7890'),
                            fontSize: orientation == Orientation.portrait
                                ? 14.sp
                                : 25.sp),
                      )),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: DefaultButton(
                  btnLblStyle: orientation == Orientation.portrait
                      ? Theme.of(context).textTheme.button
                      : TextStyle(color: Colors.white, fontSize: 30.sp),
                  height: orientation == Orientation.portrait ? 45.h : 70.h,
                  borderColor: mainAppColor,
                  horizontalMarginIsEnabled: true,
                  btnLbl: AppLocalizations.of(context)!.translate('sign_in')!,
                  onPressedFunction: () {},
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Text(' —————————— ' +
                    AppLocalizations.of(context)!.translate('or')! +
                    '  ——————————'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultButton(
                    width: 0.26.sw,
                    horizontalMarginIsEnabled: false,
                    height: 
                    orientation == Orientation.portrait
                      ? 30.h :50.h,
                    btnLbl: 'Facebook',
                    btnLblStyle:
                        TextStyle(color: Colors.white, fontSize:  orientation == Orientation.portrait?
                        10.sp : 20.sp),
                    btnColor: const Color(0xff3C5A99),
                    prefixIcon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size:  orientation == Orientation.portrait
                      ?  15.h : 30.h,
                    ),
                  ),
                  DefaultButton(
                    width: 0.26.sw,
                    horizontalMarginIsEnabled: false,
                    height: 
                    orientation == Orientation.portrait
                      ? 30.h :50.h,
                    btnLbl: 'Google',
                    btnLblStyle:
                        TextStyle(color: Colors.white,  fontSize:  orientation == Orientation.portrait?
                        10.sp : 20.sp),
                    btnColor: const Color(0xffF95341),
                    prefixIcon: Icon(
                      FontAwesomeIcons.googlePlus,
                      color: Colors.white,
                     size:  orientation == Orientation.portrait
                      ?  15.h : 30.h,
                    ),
                  ),
                  DefaultButton(
                    width: 0.26.sw,
                    horizontalMarginIsEnabled: false,
                  height: 
                    orientation == Orientation.portrait
                      ? 30.h :50.h,
                    btnLbl: 'Microsoft',
                    btnLblStyle:
                        TextStyle(color: Colors.white,  fontSize:  orientation == Orientation.portrait?
                        10.sp : 20.sp),
                    btnColor: const Color(0xff0491FF),
                    prefixIcon: Icon(
                      FontAwesomeIcons.windows,
                      color: Colors.white,
                      size:  orientation == Orientation.portrait
                      ?  15.h : 30.h,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: orientation == Orientation.portrait? 10.h : 15.h),
                child: Text.rich(TextSpan(
                    text: AppLocalizations.of(context)!
                        .translate('don’t_have_account?')!,
                    style:
                        TextStyle( fontSize:  orientation == Orientation.portrait?
                        14.sp : 20.sp, color: HexColor('7B7890')),
                    children: <InlineSpan>[
                      const TextSpan(text: '  '),
                      TextSpan(
                        text:
                            AppLocalizations.of(context)!.translate('sign_up')!,
                        style: TextStyle(
                            fontSize:  orientation == Orientation.portrait?
                        14.sp : 20.sp,
                            color: mainAppColor,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        body: _buildBodyItem(),
      ),
    );
  }
}
