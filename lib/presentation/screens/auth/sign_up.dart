import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_app/business_logic/cubits/sign_up/sign_up_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:student_app/utils/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fisrtNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AutovalidateMode autovalidateMode(SignUpState state) => state
          is SignUpValidatation
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  Widget _buildBodyItem(SignUpState signUpState) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode(signUpState),
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/login_bg.png',
                  height: 130.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.translate("sign_up")!,
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
              Row(
                children: [
                  SizedBox(
                    height: orientation == Orientation.portrait ? 70.h : 100.h,
                    width: 180.w,
                    child: PredefinedTextFormField(
                      validationFunction: validateFirstName,
                      hintTxt:
                          AppLocalizations.of(context)!.translate('first_name'),
                      controller: _fisrtNameController,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: orientation == Orientation.portrait ? 70.h : 100.h,
                    width: 180.w,
                    child: PredefinedTextFormField(
                      validationFunction: validateLastName,
                      hintTxt:
                          AppLocalizations.of(context)!.translate('last_name'),
                      controller: _lastNameController,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              PredefinedTextFormField(
                validationFunction: validateUserName,
                controller: _userNameController,
                hintTxt: AppLocalizations.of(context)!.translate("user_name")!,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: orientation == Orientation.portrait ? 10.h : 20.h,
              ),
              PredefinedTextFormField(
                inputData: TextInputType.emailAddress,
                validationFunction: validateEmail,
                controller: _emailController,
                hintTxt: AppLocalizations.of(context)!.translate("email")!,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                controller: _passwordController,
                validationFunction: validatePasswordForSignUp,
                hintTxt:
                    AppLocalizations.of(context)!.translate("enter_password")!,
                isPassword: true,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                validationFunction: validateConfirmPassword,
                hintTxt: AppLocalizations.of(context)!
                    .translate("enter_confirm_password")!,
                isPassword: true,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  if (!context.watch<SignUpCubit>().isLoading) {
                    BlocProvider.of<SignUpCubit>(context).signUp(
                      formKey: _formKey,
                      password: _passwordController.text.trim(),
                      email: _emailController.text.trim(),
                      userName: _userNameController.text.trim(),
                      firstName: _fisrtNameController.text.trim(),
                      lastName: _lastNameController.text.trim(),
                    );
                  }
                },
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 15.h,
              ),
              !context.watch<SignUpCubit>().isLoading
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
                              .translate('sign_up')!,
                          onPressedFunction: () =>
                              BlocProvider.of<SignUpCubit>(context).signUp(
                                formKey: _formKey,
                                password: _passwordController.text.trim(),
                                email: _emailController.text.trim(),
                                userName: _userNameController.text.trim(),
                                firstName: _fisrtNameController.text.trim(),
                                lastName: _lastNameController.text.trim(),
                              )),
                    )
                  : Center(
                      child:
                          SpinKitFadingCircle(size: 45.h, color: mainAppColor),
                    ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(' ————— ' +
                    AppLocalizations.of(context)!.translate('or')! +
                    '  —————'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
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
                            size: orientation == Orientation.portrait
                                ? 15.h
                                : 30.h,
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
                            size: orientation == Orientation.portrait
                                ? 12.h
                                : 30.h,
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
                            size: orientation == Orientation.portrait
                                ? 15.h
                                : 30.h,
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
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    vertical:
                        orientation == Orientation.portrait ? 10.h : 15.h),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, loginRoute),
                  child: Text.rich(TextSpan(
                      text: AppLocalizations.of(context)!
                          .translate('already_have_account?')!,
                      style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? 14.sp
                              : 25.sp,
                          color: HexColor('7B7890')),
                      children: <InlineSpan>[
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .translate('sign_in')!,
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
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSucccess) {
                Commons.showToast(context, message: state.message);
                state.navigate(context);
              } else if (state is SignUpFailure) {
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
