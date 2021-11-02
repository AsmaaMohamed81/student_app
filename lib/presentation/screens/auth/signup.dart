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

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fisrtNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

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
                  height: 130.h,
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
                  Expanded(
                    child: PredefinedTextFormField(
                      maxLines: 1,
                      validationFunction: validateFirstName,
                      hintTxt: 'First Name',
                      controller: _fisrtNameController,
                    ),
                  ),
                  Expanded(
                    child: PredefinedTextFormField(
                      maxLines: 1,
                      validationFunction: validateLastName,
                      hintTxt: 'Last Name',
                      controller: _lastNameController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                maxLines: 1,
                validationFunction: validateUserName,
                controller: _usernameController,
                hintTxt: AppLocalizations.of(context)!.translate("user_name")!,
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                maxLines: 1,
                validationFunction: validateUserNameOrEmail,
                controller: _emailController,
                hintTxt: AppLocalizations.of(context)!.translate("email")!,
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                controller: _passwordController,
                validationFunction: validatePasswordsignup,
                hintTxt:
                    AppLocalizations.of(context)!.translate("enter_password")!,
                isPassword: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                controller: _confirmpasswordController,
                validationFunction: validateConfirmPassword,
                hintTxt: AppLocalizations.of(context)!
                    .translate("enter_confirm_password")!,
                isPassword: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 15.h,
              ),
              !BlocProvider.of<AuthCubit>(context).isLoadingSignUp
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
                            AppLocalizations.of(context)!.translate('sign_up')!,
                        onPressedFunction: () {
                          if (!BlocProvider.of<AuthCubit>(context)
                              .isLoadingSignUp) {
                            BlocProvider.of<AuthCubit>(context).signUp(
                                formKey: _formKey,
                                passwordController: _passwordController,
                                emailController: _emailController,
                                userNameController: _usernameController,
                                firstNameController: _fisrtNameController,
                                lasrNameController: _lastNameController,
                                confirmpasswordController:
                                    _confirmpasswordController);
                          }
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(color: mainAppColor),
                    ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(' —————————— ' +
                    AppLocalizations.of(context)!.translate('or')! +
                    '  ——————————'),
              ),
              SizedBox(
                height: 10.h,
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
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/login'),
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
                  '/home', (Route<dynamic> route) => false);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const HomeScreen(),
              // ));
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
