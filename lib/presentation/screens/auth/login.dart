import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_app/business_logic/cubits/login/login_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
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

  Widget _buildBodyItem(LoginState state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode(state),
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/login_bg.png',
                  height: 150.h,
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
                          orientation == Orientation.portrait ? 25.sp : 50.sp),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              PredefinedTextFormField(
                maxLines: 1,
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
                validationFunction: validatePasswordForLogin,
                hintTxt:
                    AppLocalizations.of(context)!.translate("enter_password")!,
                isPassword: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, forgotPasswordRoute),
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate('forgot_your_password')!,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: HexColor('7B7890'),
                          fontSize: orientation == Orientation.portrait
                              ? 14.sp
                              : 25.sp),
                    ),
                  )),
              SizedBox(
                height: 15.h,
              ),
              !context.watch<LoginCubit>().isLoading
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
                          btnLbl: AppLocalizations.of(context)!
                              .translate('sign_in')!,
                          onPressedFunction: () =>
                              BlocProvider.of<LoginCubit>(context).login(
                                  formKey: _formKey,
                                  passwordController: _passwordController,
                                  emailController: _emailController)),
                    )
                  : Center(
                      child:
                          SpinKitFadingCircle(size: 45.h, color: mainAppColor),
                    ),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Text(' ————— ' +
                    AppLocalizations.of(context)!.translate('or')! +
                    '  —————'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 0.25.sw,
                    height: orientation == Orientation.portrait ? 28.h : 50.h,
                    decoration: BoxDecoration(
                        color: const Color(0xff3C5A99),
                        borderRadius: BorderRadius.circular((10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size:
                              orientation == Orientation.portrait ? 15.h : 30.h,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          'Facebook',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: orientation == Orientation.portrait
                                  ? 9.sp
                                  : 20.sp),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 0.25.sw,
                    height: orientation == Orientation.portrait ? 28.h : 50.h,
                    decoration: BoxDecoration(
                        color: const Color(0xffF95341),
                        borderRadius: BorderRadius.circular((10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size:
                              orientation == Orientation.portrait ? 12.h : 30.h,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          'Google',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: orientation == Orientation.portrait
                                  ? 9.sp
                                  : 20.sp),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 0.25.sw,
                    height: orientation == Orientation.portrait ? 28.h : 50.h,
                    decoration: BoxDecoration(
                        color: const Color(0xff0491FF),
                        borderRadius: BorderRadius.circular((10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.windows,
                          color: Colors.white,
                          size:
                              orientation == Orientation.portrait ? 15.h : 30.h,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          'Microsoft',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: orientation == Orientation.portrait
                                  ? 9.sp
                                  : 20.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    vertical:
                        orientation == Orientation.portrait ? 10.h : 15.h),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, signUpRoute),
                  child: Text.rich(TextSpan(
                      text: AppLocalizations.of(context)!
                          .translate('don’t_have_account?')!,
                      style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? 14.sp
                              : 25.sp,
                          color: HexColor('7B7890')),
                      children: <InlineSpan>[
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .translate('sign_up')!,
                          style: TextStyle(
                              fontSize: orientation == Orientation.portrait
                                  ? 14.sp
                                  : 25.sp,
                              color: mainAppColor,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
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
        ),
      );
    });
  }

  AutovalidateMode autovalidateMode(LoginState state) => state
          is LoginValidatation
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is Authenticated) {
                if (state.user.mainRoleType == "Student") {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      homeRoute, (Route<dynamic> route) => false);
                } else {
                  Commons.showError(
                      context, "The user name or password is wrong");
                }
              } else if (state is UnAuthenticated) {
                Commons.showError(context, state.message);
              }
            },
            builder: (context, state) {
              return _buildBodyItem(state);
            },
          ),
        ),
      ),
    );
  }
}
