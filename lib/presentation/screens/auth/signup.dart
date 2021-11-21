import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  // Widget _buildBodyItem(AuthState state) {
  //   return OrientationBuilder(builder: (context, orientation) {
  //     return SingleChildScrollView(
  //       child: Padding(
  //         padding:
  //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //         child: Form(
  //           autovalidateMode: autovalidateMode(state),
  //           key: _formKey,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Align(
  //                 alignment: Alignment.topRight,
  //                 child: Image.asset(
  //                   'assets/images/login_bg.png',
  //                   height: 130.h,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),
  //               Center(
  //                 child: Text(
  //                   AppLocalizations.of(context)!.translate("sign_up")!,
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: orientation == Orientation.portrait
  //                           ? 28.sp
  //                           : 50.sp),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 15.h,
  //               ),
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     height: 70.h,
  //                     width: 180.w,
  //                     child: PredefinedTextFormField(
  //                       maxLines: 1,
  //                       validationFunction: validateFirstName,
  //                       hintTxt: 'First Name',
  //                       controller: _fisrtNameController,
  //                       onEditingComplete: () {
  //                         FocusScope.of(context).nextFocus();
  //                       },
  //                       textInputAction: TextInputAction.next,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: 180.w,
  //                     height: 70.h,
  //                     child: PredefinedTextFormField(
  //                       maxLines: 1,
  //                       validationFunction: validateLastName,
  //                       hintTxt: 'Last Name',
  //                       controller: _lastNameController,
  //                       onEditingComplete: () {
  //                         FocusScope.of(context).nextFocus();
  //                       },
  //                       textInputAction: TextInputAction.next,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               PredefinedTextFormField(
  //                 maxLines: 1,
  //                 validationFunction: validateUserName,
  //                 controller: _usernameController,
  //                 hintTxt:
  //                     AppLocalizations.of(context)!.translate("user_name")!,
  //                 onEditingComplete: () {
  //                   FocusScope.of(context).nextFocus();
  //                 },
  //                 textInputAction: TextInputAction.next,
  //               ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),
  //               PredefinedTextFormField(
  //                 inputData: TextInputType.emailAddress,
  //                 maxLines: 1,
  //                 validationFunction: validateEmail,
  //                 controller: _emailController,
  //                 hintTxt: AppLocalizations.of(context)!.translate("email")!,
  //                 onEditingComplete: () {
  //                   FocusScope.of(context).nextFocus();
  //                 },
  //                 textInputAction: TextInputAction.next,
  //               ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),
  //               PredefinedTextFormField(
  //                 controller: _passwordController,
  //                 validationFunction: validatePasswordsignup,
  //                 hintTxt: AppLocalizations.of(context)!
  //                     .translate("enter_password")!,
  //                 isPassword: true,
  //                 maxLines: 1,
  //                 onEditingComplete: () {
  //                   FocusScope.of(context).nextFocus();
  //                 },
  //                 onFieldSubmitted: (v) {
  //                   FocusScope.of(context).nextFocus();
  //                 },
  //                 textInputAction: TextInputAction.next,
  //               ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),
  //               PredefinedTextFormField(
  //                 controller: _confirmpasswordController,
  //                 validationFunction: validateConfirmPassword,
  //                 hintTxt: AppLocalizations.of(context)!
  //                     .translate("enter_confirm_password")!,
  //                 isPassword: true,
  //                 maxLines: 1,
  //                 onFieldSubmitted: (value) {
  //                   FocusScope.of(context).unfocus();
  //                   if (!BlocProvider.of<AuthCubit>(context).isLoadingSignUp) {
  //                     BlocProvider.of<AuthCubit>(context).signUp(
  //                         formKey: _formKey,
  //                         passwordController: _passwordController,
  //                         emailController: _emailController,
  //                         userNameController: _usernameController,
  //                         firstNameController: _fisrtNameController,
  //                         lasrNameController: _lastNameController,
  //                         confirmpasswordController:
  //                             _confirmpasswordController);
  //                   }
  //                 },
  //                 textInputAction: TextInputAction.done,
  //               ),
  //               SizedBox(
  //                 height: 15.h,
  //               ),
  //               !BlocProvider.of<AuthCubit>(context).isLoadingSignUp
  //                   ? Container(
  //                       margin: EdgeInsets.symmetric(horizontal: 10.w),
  //                       child: DefaultButton(
  //                         btnLblStyle: orientation == Orientation.portrait
  //                             ? Theme.of(context).textTheme.button
  //                             : TextStyle(color: Colors.white, fontSize: 30.sp),
  //                         height:
  //                             orientation == Orientation.portrait ? 45.h : 70.h,
  //                         borderColor: mainAppColor,
  //                         horizontalMarginIsEnabled: true,
  //                         btnLbl: AppLocalizations.of(context)!
  //                             .translate('sign_up')!,
  //                         onPressedFunction: () {
  //                           if (!BlocProvider.of<AuthCubit>(context)
  //                               .isLoadingSignUp) {
  //                             BlocProvider.of<AuthCubit>(context).signUp(
  //                                 formKey: _formKey,
  //                                 passwordController: _passwordController,
  //                                 emailController: _emailController,
  //                                 userNameController: _usernameController,
  //                                 firstNameController: _fisrtNameController,
  //                                 lasrNameController: _lastNameController,
  //                                 confirmpasswordController:
  //                                     _confirmpasswordController);
  //                           }
  //                         },
  //                       ),
  //                     )
  //                   : Center(
  //                       child: CircularProgressIndicator(color: mainAppColor),
  //                     ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),
  //               Center(
  //                 child: Text(' ————— ' +
  //                     AppLocalizations.of(context)!.translate('or')! +
  //                     '  —————'),
  //               ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   DefaultButton(
  //                     width: 0.26.sw,
  //                     horizontalMarginIsEnabled: false,
  //                     height: orientation == Orientation.portrait ? 30.h : 50.h,
  //                     btnLbl: 'Facebook',
  //                     btnLblStyle: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: orientation == Orientation.portrait
  //                             ? 10.sp
  //                             : 20.sp),
  //                     btnColor: const Color(0xff3C5A99),
  //                     prefixIcon: Icon(
  //                       FontAwesomeIcons.facebook,
  //                       color: Colors.white,
  //                       size: orientation == Orientation.portrait ? 15.h : 30.h,
  //                     ),
  //                   ),
  //                   DefaultButton(
  //                     width: 0.26.sw,
  //                     horizontalMarginIsEnabled: false,
  //                     height: orientation == Orientation.portrait ? 30.h : 50.h,
  //                     btnLbl: 'Google',
  //                     btnLblStyle: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: orientation == Orientation.portrait
  //                             ? 10.sp
  //                             : 20.sp),
  //                     btnColor: const Color(0xffF95341),
  //                     prefixIcon: Icon(
  //                       FontAwesomeIcons.googlePlus,
  //                       color: Colors.white,
  //                       size: orientation == Orientation.portrait ? 15.h : 30.h,
  //                     ),
  //                   ),
  //                   DefaultButton(
  //                     width: 0.26.sw,
  //                     horizontalMarginIsEnabled: false,
  //                     height: orientation == Orientation.portrait ? 30.h : 50.h,
  //                     btnLbl: 'Microsoft',
  //                     btnLblStyle: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: orientation == Orientation.portrait
  //                             ? 10.sp
  //                             : 20.sp),
  //                     btnColor: const Color(0xff0491FF),
  //                     prefixIcon: Icon(
  //                       FontAwesomeIcons.windows,
  //                       color: Colors.white,
  //                       size: orientation == Orientation.portrait ? 15.h : 30.h,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 alignment: Alignment.center,
  //                 margin: EdgeInsets.symmetric(
  //                     vertical:
  //                         orientation == Orientation.portrait ? 10.h : 15.h),
  //                 child: InkWell(
  //                   onTap: () => Navigator.pushNamed(context, loginRoute),
  //                   child: Text.rich(TextSpan(
  //                       text: AppLocalizations.of(context)!
  //                           .translate('already_have_account?')!,
  //                       style: TextStyle(
  //                           fontSize: orientation == Orientation.portrait
  //                               ? 14.sp
  //                               : 25.sp,
  //                           color: HexColor('7B7890')),
  //                       children: <InlineSpan>[
  //                         const TextSpan(text: '  '),
  //                         TextSpan(
  //                           text: AppLocalizations.of(context)!
  //                               .translate('sign_in')!,
  //                           style: TextStyle(
  //                               fontSize: orientation == Orientation.portrait
  //                                   ? 14.sp
  //                                   : 25.sp,
  //                               color: mainAppColor,
  //                               fontWeight: FontWeight.bold),
  //                         )
  //                       ])),
  //                 ),
  //               ),
  //               Align(
  //                 alignment: Alignment.center,
  //                 child: SizedBox(
  //                   width: 120.w,
  //                   child: Divider(
  //                     indent: 2,
  //                     thickness: 4,
  //                     height: 10.h,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  // AutovalidateMode autovalidateMode(AuthState state) => state
  //         is AuthValidateState
  //     ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
  //     : AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return 
    NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [],
          )
          //  BlocConsumer<AuthCubit, AuthState>(
          //   listener: (context, state) {
          //     if (state is SignUp) {
          //       Navigator.of(context).pushNamedAndRemoveUntil(
          //           homeRoute, (Route<dynamic> route) => false);
          //       // Navigator.of(context).push(MaterialPageRoute(
          //       //   builder: (context) => const HomeScreen(),
          //       // ));
          //     } else if (state is FailSignUp) {
          //       Commons.showError(context, state.message);
          //     }
          //   },
          //   builder: (context, state) {
          //     return _buildBodyItem(state);
          //   },
          // ),
        ),
      ),
    );
  }
}
