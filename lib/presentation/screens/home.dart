import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/business_logic/cubits/locale/locale_cubit.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/preferences_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.translate("home")!),
          DefaultButton(
            borderColor: mainAppColor,
            btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
            btnColor: Colors.white,
            btnLbl: AppLocalizations.of(context)!.translate("log_out")!,
            onPressedFunction: () {
              SharedPreferencesFormatter.remove("user");

              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                borderColor: mainAppColor,
                btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
                btnColor: Colors.white,
                btnLbl: AppLocalizations.of(context)!.translate("arabic")!,
                onPressedFunction: () =>
                    BlocProvider.of<LocaleCubit>(context).toArabic(),
              ),
              DefaultButton(
                borderColor: mainAppColor,
                btnLblStyle: TextStyle(color: mainAppColor, fontSize: 17.sp),
                btnColor: Colors.white,
                btnLbl: AppLocalizations.of(context)!.translate("english")!,
                onPressedFunction: () =>
                    BlocProvider.of<LocaleCubit>(context).toEnglish(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
