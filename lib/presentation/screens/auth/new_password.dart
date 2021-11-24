import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_app/business_logic/cubits/new_password/new_password_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/network_indicator.dart';
import 'package:student_app/presentation/widgets/page_container.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/predefined_text_form_field.dart';
import 'package:student_app/presentation/widgets/predefined_text_form_field/validation_mixin.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/commons.dart';
import 'package:student_app/utils/strings.dart';

class NewPassWordScreen extends StatefulWidget {
  final String? email;

  const NewPassWordScreen({Key? key, this.email}) : super(key: key);

  @override
  _NewPassWordScreenState createState() => _NewPassWordScreenState();
}

class _NewPassWordScreenState extends State<NewPassWordScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  AutovalidateMode autovalidateMode(NewPasswordState state) => state
          is NewPasswordValidatation
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  Widget _buildBodyItem(NewPasswordState state) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode(state),
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              PredefinedTextFormField(
                controller: _passwordController,
                validationFunction: validatePasswordForSignUp,
                hintTxt:
                    AppLocalizations.of(context)!.translate("enter_password")!,
                isPassword: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              PredefinedTextFormField(
                validationFunction: validateConfirmPassword,
                hintTxt: AppLocalizations.of(context)!
                    .translate("enter_confirm_password")!,
                isPassword: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 100.h,
              ),
              !context.watch<NewPasswordCubit>().isLoading
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: DefaultButton(
                          btnLblStyle: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? Theme.of(context).textTheme.button
                              : Theme.of(context).textTheme.headline3,
                          height:
                              orientation == Orientation.portrait ? 45.h : 70.h,
                          borderColor: mainAppColor,
                          horizontalMarginIsEnabled: true,
                          btnLbl: AppLocalizations.of(context)!
                              .translate('submit')!,
                          onPressedFunction: () {
                            BlocProvider.of<NewPasswordCubit>(context)
                                .resetLostPassword(
                                    formKey: _formKey,
                                    email: widget.email!,
                                    passWord: _passwordController.text.trim());
                          }),
                    )
                  : Center(
                      child: SpinKitFadingCircle(
                          size: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 45.h
                              : 70.h,
                          color: mainAppColor),
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
      title: Text(
          AppLocalizations.of(context)!.translate('enter_new_password')!,
          style: MediaQuery.of(context).orientation == Orientation.portrait
              ? Theme.of(context).textTheme.headline1
              : Theme.of(context).textTheme.headline2),
    );
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: appBar,
          body: BlocConsumer<NewPasswordCubit, NewPasswordState>(
            listener: (context, state) {
              if (state is NewPasswordSuccess) {
                Commons.showToast(context, message: state.message);
                Navigator.pushNamed(context, loginRoute);
              } else if (state is NewPasswordFailure) {
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
