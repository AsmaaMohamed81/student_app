import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/business_logic/cubits/forgot_password/forgot_password_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';
import 'package:student_app/utils/app_colors.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // AutovalidateMode autovalidateMode(ForgotPasswordCubit state) => state
  //         is ForgetPasswordValidateState
  //     ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
  //     : AutovalidateMode.disabled;

  Widget _buildBodyItem(ForgotPasswordState state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
       //   autovalidateMode: autovalidateMode(state),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: GoogleFonts.tajawal().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize:
                            orientation == Orientation.portrait ? 16.sp : 30.sp,
                        color: const Color(0xff7B7890),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppLocalizations.of(context)!
                                .translate('enter')),
                        TextSpan(
                            text: AppLocalizations.of(context)!
                                .translate('your_email_address'),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: mainAppColor,
                              fontFamily: GoogleFonts.tajawal().fontFamily,
                            )),
                        TextSpan(
                            text: AppLocalizations.of(context)!
                                .translate('to_reset_your_password')),
                      ],
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
              PredefinedTextFormField(
                hintTxt: AppLocalizations.of(context)!.translate('email'),
                validationFunction: validateEmail,
                inputData: TextInputType.emailAddress,
                controller: _emailController,
              ),
              SizedBox(
                height: 100.h,
              ),
              !context.watch<ForgotPasswordCubit>().isLoading
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: DefaultButton(
                          btnLblStyle: orientation == Orientation.portrait
                              ? TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)
                              : TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                          height:
                              orientation == Orientation.portrait ? 45.h : 70.h,
                          borderColor: mainAppColor,
                          horizontalMarginIsEnabled: true,
                          btnLbl:
                              AppLocalizations.of(context)!.translate('send')!,
                          onPressedFunction: () =>
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .sendEmail(
                                      formKey: _formKey,
                                      email: _emailController.text.trim())),
                    )
                  : Center(
                        child: SpinKitFadingCircle(
                            size: 45.h, color: mainAppColor),
                      )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      title: Text(AppLocalizations.of(context)!.translate('forgot_password')!,
          style: Theme.of(context).textTheme.headline1),
    );
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBar,
          body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              // if (state is SentMail) {
              //   Navigator.pushNamed(context, verifyCodeRoute,
              //       arguments: _emailController.text.trim());

              //   Commons.showToast(context, message: state.message);
              // } else if (state is FailSendMail) {
              //   Commons.showError(context, state.message);
              // }
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
