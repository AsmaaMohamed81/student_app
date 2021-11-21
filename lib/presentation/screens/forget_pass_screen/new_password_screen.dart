import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_app/business_logic/cubits/forgetpassword/forget_password_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';

import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/strings.dart';
import 'package:student_app/utils/urls.dart';

import 'arguments.dart';

class NewPassWordScreen extends StatefulWidget {
  final String? email;

  const NewPassWordScreen({Key? key, this.email}) : super(key: key);

  @override
  _NewPassWordScreenState createState() => _NewPassWordScreenState();
}

class _NewPassWordScreenState extends State<NewPassWordScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  late Arguments arg;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
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
              AppLocalizations.of(context)!.translate('enter_new_password')!,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ResetLostPassword) {
                Navigator.pushNamed(context, loginRoute);

                Commons.showToast(context, message: state.message);
              } else if (state is FailResetLostPassword) {
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

  AutovalidateMode autovalidateMode(ForgetPasswordState state) => state
          is ForgetPasswordValidateState
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  Widget _buildBodyItem(ForgetPasswordState state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode(state),
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Column(
              children: [
                PredefinedTextFormField(
                  controller: _passwordController,
                  validationFunction: validatePasswordsignup,
                  hintTxt: AppLocalizations.of(context)!
                      .translate("enter_password")!,
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
                _buildSendBtn(orientation),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSendBtn(orientation) {
    return !BlocProvider.of<ForgetPasswordCubit>(context).isLoadingresetpass
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: DefaultButton(
                btnLblStyle: orientation == Orientation.portrait
                    ? Theme.of(context).textTheme.button
                    : TextStyle(color: Colors.white, fontSize: 30.sp),
                height: orientation == Orientation.portrait ? 45.h : 70.h,
                borderColor: mainAppColor,
                horizontalMarginIsEnabled: true,
                btnLbl: AppLocalizations.of(context)!.translate('submit')!,
                onPressedFunction: () {
                  print("${widget.email}${_passwordController.text.trim()}");
                  if (!BlocProvider.of<ForgetPasswordCubit>(context)
                      .isLoadingresetpass) {
                    BlocProvider.of<ForgetPasswordCubit>(context)
                        .resetLLostPassword(
                            formKey: _formKey,
                            email: widget.email!,
                            passWord: _passwordController.text.trim());
                  }
                }),
          )
        : Center(
            child: CircularProgressIndicator(color: mainAppColor),
          );
  }
}
