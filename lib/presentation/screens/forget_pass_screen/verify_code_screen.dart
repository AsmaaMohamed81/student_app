import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/forgetpassword/forget_password_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/custom_text/custom_text.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';

import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:student_app/utils/strings.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;

  const VerifyCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  Timer? timer;
  String? code, num1, num2, num3, num4;
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  bool hasError = false;

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();

    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
    timer!.cancel();
  }

  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        // print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: Text(
              AppLocalizations.of(context)!.translate('verify_code')!,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is SendVerifyCode) {
                // Commons.showToast(context, message: state.message);
                Navigator.pushNamed(context, newPasswordRoute,
                    arguments: widget.email);
              } else if (state is FailVerifyCode) {
                Commons.showError(
                    context, "Please enter correct code. Try again.");
              } else if (state is ReSentMail) {
                Commons.showToast(context, message: state.message);
              } else if (state is FailReSendMail) {
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

  Widget _buildBodyItem(state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDescText(),
                const SizedBox(
                  height: 30,
                ),

                Padding(
                    padding: orientation == Orientation.portrait
                        ? EdgeInsets.symmetric(
                            vertical: 2.0.w, horizontal: 60.h)
                        : EdgeInsets.symmetric(
                            vertical: 2.0.w, horizontal: 300.h),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,

                      obscureText: false,
                      // obscuringCharacter: '*',
                      // obscuringWidget: FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      // validator: (v) {
                      //   if (v!.length < 4) {
                      //     return "I'm from validator";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                        errorBorderColor: Colors.purple,
                        activeColor: mainAppColor,
                        borderWidth: 2,
                        selectedFillColor: Colors.white,
                        inactiveColor: mainAppColor,
                        inactiveFillColor: Colors.white,
                        disabledColor: Colors.white,
                        selectedColor: Colors.white,
                      ),

                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      // controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "Please enter code" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),

                // Padding(
                //   padding: orientation == Orientation.portrait
                //       ? EdgeInsets.symmetric(horizontal: 70.w)
                //       : EdgeInsets.symmetric(horizontal: 120.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: PredefinedTextFormField(
                //           horizontalMargin: 2.w,
                //           hintTxt: ' ',
                //           validationFunction: validateCode,
                //           inputData: TextInputType.number,
                //           maxLength: 1,
                //           textAlign: TextAlign.center,
                //           onChangedFunction: (text) {
                //             if (text!.length == 1) {
                //               FocusScope.of(context).nextFocus();
                //               num1 = text;
                //             } else if (text.length == 0) {
                //               FocusScope.of(context).previousFocus();
                //             }
                //           },
                //         ),
                //       ),
                //       Expanded(
                //         child: PredefinedTextFormField(
                //           horizontalMargin: 2.w,
                //           hintTxt: ' ',
                //           validationFunction: validateCode,
                //           inputData: TextInputType.number,
                //           maxLength: 1,
                //           textAlign: TextAlign.center,
                //           onChangedFunction: (text) {
                //             if (text!.length == 1) {
                //               FocusScope.of(context).nextFocus();
                //               num2 = text;
                //             } else if (text.isEmpty) {
                //               FocusScope.of(context).previousFocus();
                //             }
                //           },
                //         ),
                //       ),
                //       Expanded(
                //         child: PredefinedTextFormField(
                //           horizontalMargin: 2.w,
                //           hintTxt: ' ',
                //           validationFunction: validateCode,
                //           inputData: TextInputType.number,
                //           maxLength: 1,
                //           textAlign: TextAlign.center,
                //           onChangedFunction: (text) {
                //             if (text!.length == 1) {
                //               FocusScope.of(context).nextFocus();
                //               num3 = text;
                //             } else if (text.length == 0) {
                //               FocusScope.of(context).previousFocus();
                //             }
                //           },
                //         ),
                //       ),
                //       Expanded(
                //         child: PredefinedTextFormField(
                //           horizontalMargin: 2.w,
                //           hintTxt: ' ',
                //           validationFunction: validateCode,
                //           inputData: TextInputType.number,
                //           maxLength: 1,
                //           textAlign: TextAlign.center,
                //           onChangedFunction: (text) {
                //             if (text!.length == 1) {
                //               FocusScope.of(context).nextFocus();
                //               num4 = text;
                //             } else if (text.length == 0) {
                //               FocusScope.of(context).previousFocus();
                //             }
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppLocalizations.of(context)!
                          .translate("donot_receive_code")!,
                      color: textForgetPassColor,
                      fontSize: 14,
                    ),
                    !BlocProvider.of<ForgetPasswordCubit>(context)
                            .isLoadingresend
                        ? GestureDetector(
                            onTap: () async {
                              if (!BlocProvider.of<ForgetPasswordCubit>(context)
                                  .isLoadingresend) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .resendEmail(
                                        formKey: _formKey,
                                        email: widget.email!);
                              }
                              startTimeout();
                            },
                            child: CustomText(
                              text: AppLocalizations.of(context)!
                                  .translate('resend')!,
                              color: mainAppColor,
                              fontSize: 14,
                              // onChangedFunc: (text) {
                              //   _userEmail = text;
                              // },
                            ),
                          )
                        : Center(
                            child:
                                CircularProgressIndicator(color: mainAppColor),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "($timerText)",
                      style:
                          TextStyle(color: textForgetPassColor, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                _buildSendBtn(orientation),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDescText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: textForgetPassColor,
        ),
        children: <TextSpan>[
          TextSpan(
              text:
                  AppLocalizations.of(context)!.translate('check_your_email')!),
          TextSpan(
              text: '${widget.email}',
              style: TextStyle(
                color: mainAppColor,
                fontSize: 13,
              )),
        ],
      ),
    );
  }

  Widget _buildSendBtn(orientation) {
    code = "$num1$num2$num3$num4";
    return !BlocProvider.of<ForgetPasswordCubit>(context).isLoadingverify
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
                  if (currentText.length != 4) {
                    setState(() {
                      hasError = true;
                    });
                  } else {
                    hasError = false;

                    if (!BlocProvider.of<ForgetPasswordCubit>(context)
                        .isLoadingverify) {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .sendVeifyCode(
                              formKey: _formKey,
                              email: widget.email!,
                              code: currentText);
                    }
                  }
                }),
          )
        : Center(
            child: CircularProgressIndicator(color: mainAppColor),
          );
  }
}
