import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:student_app/utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _buildBodyItem(AuthState state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode(state),
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
                validationFunction: validateUserNameOrEmail,
                controller: _emailController,
                hintTxt: AppLocalizations.of(context)!
                    .translate("enter_email_or_user_name")!,
              ),
              SizedBox(
                height: 15.h,
              ),
              PredefinedTextFormField(
                controller: _passwordController,
                validationFunction: validatePassword,
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
              !BlocProvider.of<AuthCubit>(context).isLoading
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: DefaultButton(
                        btnLblStyle: orientation == Orientation.portrait
                            ? Theme.of(context).textTheme.button
                            : TextStyle(color: Colors.white, fontSize: 30.sp),
                        height:
                            orientation == Orientation.portrait ? 45.h : 70.h,
                        borderColor: mainAppColor,
                        horizontalMarginIsEnabled: true,
                        btnLbl:
                            AppLocalizations.of(context)!.translate('sign_in')!,
                        onPressedFunction: () {
                          if (!BlocProvider.of<AuthCubit>(context).isLoading) {
                            BlocProvider.of<AuthCubit>(context).login(
                                formKey: _formKey,
                                passwordController: _passwordController,
                                emailController: _emailController);
                          }
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(color: mainAppColor),
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
                    height: orientation == Orientation.portrait ? 30.h : 50.h,
                    btnLbl: 'Facebook',
                    btnLblStyle: TextStyle(
                        color: Colors.white,
                        fontSize: orientation == Orientation.portrait
                            ? 10.sp
                            : 20.sp),
                    btnColor: const Color(0xff3C5A99),
                    prefixIcon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: orientation == Orientation.portrait ? 15.h : 30.h,
                    ),
                  ),
                  DefaultButton(
                    width: 0.26.sw,
                    horizontalMarginIsEnabled: false,
                    height: orientation == Orientation.portrait ? 30.h : 50.h,
                    btnLbl: 'Google',
                    btnLblStyle: TextStyle(
                        color: Colors.white,
                        fontSize: orientation == Orientation.portrait
                            ? 10.sp
                            : 20.sp),
                    btnColor: const Color(0xffF95341),
                    prefixIcon: Icon(
                      FontAwesomeIcons.googlePlus,
                      color: Colors.white,
                      size: orientation == Orientation.portrait ? 15.h : 30.h,
                    ),
                  ),
                  DefaultButton(
                    width: 0.26.sw,
                    horizontalMarginIsEnabled: false,
                    height: orientation == Orientation.portrait ? 30.h : 50.h,
                    btnLbl: 'Microsoft',
                    btnLblStyle: TextStyle(
                        color: Colors.white,
                        fontSize: orientation == Orientation.portrait
                            ? 10.sp
                            : 20.sp),
                    btnColor: const Color(0xff0491FF),
                    prefixIcon: Icon(
                      FontAwesomeIcons.windows,
                      color: Colors.white,
                      size: orientation == Orientation.portrait ? 15.h : 30.h,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    vertical:
                        orientation == Orientation.portrait ? 10.h : 15.h),
                child: Text.rich(TextSpan(
                    text: AppLocalizations.of(context)!
                        .translate('don’t_have_account?')!,
                    style: TextStyle(
                        fontSize:
                            orientation == Orientation.portrait ? 14.sp : 25.sp,
                        color: HexColor('7B7890')),
                    children: <InlineSpan>[
                      const TextSpan(text: '  '),
                      TextSpan(
                        text:
                            AppLocalizations.of(context)!.translate('sign_up')!,
                        style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? 14.sp
                                : 25.sp,
                            color: mainAppColor,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        orientation == Orientation.portrait ? 120.w : 155.w,
                    vertical: 10.h),
                child: Divider(
                  thickness: 4,
                  height: 10.h,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  AutovalidateMode autovalidateMode(AuthState state) => state
          is AuthValidateState
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  homeRoute, (Route<dynamic> route) => false);
            } else if (state is UnAuthenticated) {
              Commons.showError(context, state.message);
            }
          },
          builder: (context, state) {
            return _buildBodyItem(state);
          },
        ),
      ),
    );
  }
}
