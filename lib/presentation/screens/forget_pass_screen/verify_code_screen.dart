import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_app/business_logic/cubits/forgetpassword/forget_password_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/screens/forget_pass_screen/arguments.dart';
import 'package:student_app/presentation/widgets/appbar/appbar.dart';
import 'package:student_app/presentation/widgets/custom_text/custom_text.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';

import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/urls.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;

  const VerifyCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();

  static const routeName = '/Arguments';
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with ValidationMixin {
  late double _height, _width;
  final _formKey = GlobalKey<FormState>();

  // final ApiProvider _apiProvider = ApiProvider();
  // late Arguments arg;
  late AppBarCustom _appBarCustom;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  Timer? timer;
  String? code, num1, num2, num3, num4;

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _appBarCustom = AppBarCustom(
        title: "Verify Code",
        keyScafold: _scaffoldKey,
        backarrow: () {
          Navigator.of(context).pop();
        });

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return PageContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBarCustom.buildAppBarRow(),
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is SendVerifyCode) {
              Commons.showToast(context, message: state.message);
              Navigator.pushNamed(context, '/new_passWord_screen',
                  arguments: widget.email);
            } else if (state is FailVerifyCode) {
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

  Widget _buildBodyItem(state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildDescText(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PredefinedTextFormField(
                        horizontalMargin: 2.w,
                        hintTxt: ' ',
                        validationFunction: validateCode,
                        inputData: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        onChangedFunction: (text) {
                          if (text!.length == 1) {
                            FocusScope.of(context).nextFocus();
                            num1 = text;
                          } else if (text.length == 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: PredefinedTextFormField(
                        horizontalMargin: 2.w,
                        hintTxt: ' ',
                        validationFunction: validateCode,
                        inputData: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        onChangedFunction: (text) {
                          if (text!.length == 1) {
                            FocusScope.of(context).nextFocus();
                            num2 = text;
                          } else if (text.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: PredefinedTextFormField(
                        horizontalMargin: 2.w,
                        hintTxt: ' ',
                        validationFunction: validateCode,
                        inputData: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        onChangedFunction: (text) {
                          if (text!.length == 1) {
                            FocusScope.of(context).nextFocus();
                            num3 = text;
                          } else if (text.length == 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: PredefinedTextFormField(
                        horizontalMargin: 2.w,
                        hintTxt: ' ',
                        validationFunction: validateCode,
                        inputData: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        onChangedFunction: (text) {
                          if (text!.length == 1) {
                            FocusScope.of(context).nextFocus();
                            num4 = text;
                          } else if (text.length == 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Didn’t receive the code?',
                      color: mainAppColor,
                      fontSize: 14,
                      // onChangedFunc: (text) {
                      //   _userEmail = text;
                      // },
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!BlocProvider.of<ForgetPasswordCubit>(context)
                            .isLoading) {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .resendEmail(
                                  formKey: _formKey, email: widget.email!);
                        }
                        startTimeout();
                      },
                      child: CustomText(
                        text: 'Resend',
                        color: mainAppColor,
                        fontSize: 14,
                        // onChangedFunc: (text) {
                        //   _userEmail = text;
                        // },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "($timerText)",
                    style: TextStyle(fontSize: 14),
                  )),
              SizedBox(
                height: _height * .2,
              ),
              _buildSendBtn(orientation),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDescText() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: RichText(
          text: TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 16,
              color: mainAppColor,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text:
                      'Check your email address, we have sent you the code at '),
              new TextSpan(
                  text: '${widget.email}',
                  style: new TextStyle(
                    color: mainAppColor,
                    fontSize: 13,
                  )),
            ],
          ),
        ));
  }

  Widget _buildSendBtn(orientation) {
    code = "$num1$num2$num3$num4";
    return !BlocProvider.of<ForgetPasswordCubit>(context).isLoading
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: DefaultButton(
              btnLblStyle: orientation == Orientation.portrait
                  ? Theme.of(context).textTheme.button
                  : TextStyle(color: Colors.white, fontSize: 30.sp),
              height: orientation == Orientation.portrait ? 45.h : 70.h,
              borderColor: mainAppColor,
              horizontalMarginIsEnabled: true,
              btnLbl: AppLocalizations.of(context)!.translate('send')!,
              onPressedFunction: () {
                print(widget.email);
                print(code);
                if (!BlocProvider.of<ForgetPasswordCubit>(context).isLoading) {
                  BlocProvider.of<ForgetPasswordCubit>(context).sendVeifyCode(
                      formKey: _formKey, email: widget.email!, code: code!);
                }
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(color: mainAppColor),
          );
  }
}
