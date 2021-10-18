import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/business_logic/cubits/locale_cubit/locale_cubit.dart';
import 'package:student_app/utils/hex_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  Future initData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  // Future<void> _checkIsLogin() async {
  //   var userData = await SharedPreferencesHelper.read("user");
  //   if (userData != null) {
  //     _authProvider.setCurrentUser(User.fromJson(userData));
  //     Navigator.pushReplacementNamed(context, '/custom_drawer');
  //   } else {
  //     Navigator.pushReplacementNamed(context, '/welcom_screen');
  //   }
  // }

  // Future<void> _checkIsFirstTime() async {
  //   bool firstTime = await PreferencesHelper.getBoolean('first_time', true);
  //   if (firstTime) {
  //     PreferencesHelper.saveBoolean('first_time',false);
  //     Navigator.pushReplacementNamed(context, '/intro_screen');
  //   } else {
  //     // _checkIsLogin();
  //   }
  // }

  Widget _buildBodyItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/images/logo.png',
          height: 370,
        ),
        Align(
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              (Text(
                "Talentnotion2021",
                style: TextStyle(fontSize: 20, color: HexColor('0F0A39')),
              )),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.copyright)
            ])),
        Image.asset(
          'assets/images/splash_background.png',
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocaleCubit>(context).getStartLang();
    initData().then((value) {
      // _checkIsFirstTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyItem(),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   Future initData() async {
//     await Future.delayed(const Duration(seconds: 2));
//   }

// @override
// void initState() {
//   super.initState();
//        BlocProvider.of<LocaleCubit>(context).getStartLang();
//        initData().then((value) {
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> MainView()));
//           });
//       }
//         // Future<void> _checkIsLogin() async {
//         //   var userData = await SharedPreferencesHelper.read("user");
//         //   if (userData != null) {
//         //     _authProvider.setCurrentUser(User.fromJson(userData));
//         //     Navigator.pushReplacementNamed(context, '/custom_drawer');
//         //   } else {
//         //     Navigator.pushReplacementNamed(context, '/welcom_screen');
//         //   }
//         // }

//         // Future<void> _checkIsFirstTime() async {
//         //   var _firstTime = await SharedPreferencesHelper.checkIsFirstTime();
//         //   if (_firstTime) {
//         //     SharedPreferencesHelper.setIsFirstTime(false);
//         //     Navigator.pushReplacementNamed(context, '/intro_screen');
//         //   } else {
//         //     _checkIsLogin();
//         //   }
//         // }

//         Widget _buildBodyItem() {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 AppLocalizations.of(context)!.translate('head_title')!,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               // Image.asset(
//               //   'assets/images/logo.png',
//               //   height: 370,
//               // ),
//               // Align(
//               //     alignment: Alignment.center,
//               //     child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               //       (Text(
//               //         "Talentnotion2021",
//               //         style: TextStyle(fontSize: 20, color: Colors.blue),
//               //       )),
//               //       const SizedBox(
//               //         width: 15,
//               //       ),
//               //       const Icon(Icons.copyright)
//               //     ])),
//               // Image.asset(
//               //   'assets/images/h.png',
//               // ),
//             ],
//           );
//         }

//         // Future<void> _getLanguage() async {
//         //   String currentLang = await SharedPreferencesHelper.getUserLang();
//         //   _authProvider.setCurrentLanguage(currentLang);
//         // }

//         // @override
//         // void initState() {
//         //   super.initState();
//         //   _getLanguage();
//         //   initData().then((value) {
//         //     _checkIsFirstTime();
//         //   });
//         // }

//         @override
//         Widget build(BuildContext context) {
//           // _authProvider = Provider.of<AuthProvider>(context);

//           return Scaffold(
//             body: _buildBodyItem(),
//           );
//         }
//       }
