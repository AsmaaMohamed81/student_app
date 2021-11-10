import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:student_app/business_logic/cubits/forgetpassword/forget_password_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';

import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/strings.dart';

class AddMailScreen extends StatefulWidget {
  const AddMailScreen({Key? key}) : super(key: key);

  @override
  _AddMailScreenState createState() => _AddMailScreenState();
}

class _AddMailScreenState extends State<AddMailScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

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
              AppLocalizations.of(context)!.translate('forgot_password')!,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is SentMail) {
                print(_emailController.text.trim());
                Navigator.pushNamed(context, verifyCodeRoute,
                    arguments: _emailController.text.trim());

                Commons.showToast(context, message: state.message);
              } else if (state is FailSendMail) {
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

//eng.asmaa.mohammed13593@gmail.com

  Widget _buildBodyItem(ForgetPasswordState state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode(state),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDescText(orientation),
              SizedBox(
                height: 30.h,
              ),
              PredefinedTextFormField(
                hintTxt: AppLocalizations.of(context)!.translate('email'),
                validationFunction: validateEmail,
                inputData: TextInputType.emailAddress,
                controller: _emailController,
                maxLines: 1,
              ),
              SizedBox(
                height: 100.h,
              ),
              _buildSendBtn(orientation),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDescText(orientation) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: orientation == Orientation.portrait ? 15.sp : 30.sp,
              color: textForgetPassColor,
            ),
            children: <TextSpan>[
              TextSpan(text: AppLocalizations.of(context)!.translate('enter')),
              TextSpan(
                  text: AppLocalizations.of(context)!
                      .translate('your_email_address'),
                  style: TextStyle(color: mainAppColor)),
              TextSpan(
                  text: AppLocalizations.of(context)!
                      .translate('to_reset_your_password')),
            ],
          ),
        ));
  }

  Widget _buildSendBtn(orientation) {
    return !BlocProvider.of<ForgetPasswordCubit>(context).isLoadingsend
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
              height: orientation == Orientation.portrait ? 45.h : 70.h,
              borderColor: mainAppColor,
              horizontalMarginIsEnabled: true,
              btnLbl: AppLocalizations.of(context)!.translate('send')!,
              onPressedFunction: () {
                if (!BlocProvider.of<ForgetPasswordCubit>(context)
                    .isLoadingsend) {
                  BlocProvider.of<ForgetPasswordCubit>(context).sendEmail(
                      formKey: _formKey, email: _emailController.text.trim());
                }
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(color: mainAppColor),
          );
  }
}
