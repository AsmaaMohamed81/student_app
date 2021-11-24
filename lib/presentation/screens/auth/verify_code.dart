import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/business_logic/cubits/verify_code/verify_code_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/timer_painter.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/strings.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;

  const VerifyCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _verifyCodeController = TextEditingController();
  late StreamController<ErrorAnimationType> _errorController;
  String get timerString {
    Duration duration =
        _animationController.duration! * _animationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    _initTimerAnimationController();
    _errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    _errorController.close();
    _animationController.dispose();
    super.dispose();
  }

  _initTimerAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    );
    _animationController.reverse(
        from: _animationController.value == 0.0
            ? 1.0
            : _animationController.value);
  }

  Widget _buildBodyItem(VerifyCodeState verifyCodeState) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 30.h),
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
                                .translate('check_your_email')!),
                        TextSpan(
                            text: widget.email,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: mainAppColor,
                              fontFamily: GoogleFonts.tajawal().fontFamily,
                            )),
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 30.w
                        : 50.w),
                child: PinCodeTextField(
                  appContext: context,
                  controller: _verifyCodeController,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 44.h
                        : 100.h,
                    fieldWidth: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 44.w
                        : 30.w,
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
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: _errorController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (value) {
                    // _verifyCode = value;
                    BlocProvider.of<VerifyCodeCubit>(context).verifyCode(
                        email: widget.email!,
                        code: _verifyCodeController.text.trim());
                  },
                  onChanged: (value) {
                    // _verifyCode = value;
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .translate("donot_receive_code")!,
                    style: TextStyle(
                        color: const Color(0xff7B7890),
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 14.sp
                            : 25.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  !context
                          .watch<VerifyCodeCubit>()
                          .isLoadingForResendingVerifyCode
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (!_animationController.isAnimating) {
                                  BlocProvider.of<VerifyCodeCubit>(context)
                                      .resendVerifyCode(email: widget.email!);
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('resend')!,
                                style: TextStyle(
                                    color: mainAppColor,
                                    fontSize:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? 14.sp
                                            : 25.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 35.h
                        : 70.h,
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: AnimatedBuilder(
                                animation: _animationController,
                                builder: (BuildContext context, Widget? child) {
                                  return CustomPaint(
                                      painter: TimerPainter(
                                          animation: _animationController,
                                          backgroundColor: Colors.white,
                                          color: mainAppColor));
                                },
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.center,
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Text(timerString,
                                        style: TextStyle(
                                            color: mainAppColor,
                                            fontSize: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? 13.sp
                                                : 22.sp,
                                            fontWeight: FontWeight.w700));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              !context.watch<VerifyCodeCubit>().isLoadingForVerifyCode
                  ? DefaultButton(
                      btnLblStyle: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? Theme.of(context).textTheme.button
                          : Theme.of(context).textTheme.headline3,
                      height: orientation == Orientation.portrait ? 45.h : 70.h,
                      borderColor: mainAppColor,
                      horizontalMarginIsEnabled: false,
                      btnLbl: AppLocalizations.of(context)!.translate('send')!,
                      onPressedFunction: () =>
                          _verifyCodeController.text.trim().length == 4
                              ? BlocProvider.of<VerifyCodeCubit>(context)
                                  .verifyCode(
                                      email: widget.email!,
                                      code: _verifyCodeController.text.trim())
                              : _errorController.add(ErrorAnimationType.shake))
                  : const SizedBox(),
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
      title: Text(AppLocalizations.of(context)!.translate('verify_code')!,
          style: MediaQuery.of(context).orientation == Orientation.portrait
              ? Theme.of(context).textTheme.headline1
              : Theme.of(context).textTheme.headline2),
    );
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: appBar,
          body: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
            listener: (context, state) {
              if (state is VerifyCodeSuccess) {
                Commons.showToast(context, message: state.message);
                Navigator.pushNamed(context, newPasswordRoute,
                    arguments: widget.email);
              } else if (state is VerifyCodeFailure) {
                Commons.showError(context, state.message);
              } else if (state is ResendingCodeSuccess) {
                Commons.showToast(context, message: state.message);
                _initTimerAnimationController();
                _verifyCodeController.clear();
              } else if (state is ResendingCodeFailure) {
                Commons.showError(context, state.message);
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  _buildBodyItem(state),
                  context
                              .watch<VerifyCodeCubit>()
                              .isLoadingForResendingVerifyCode ||
                          context
                              .watch<VerifyCodeCubit>()
                              .isLoadingForVerifyCode
                      ? Center(
                          child: SpinKitFadingCircle(
                              size: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 45.h
                                  : 70.h,
                              color: mainAppColor),
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
