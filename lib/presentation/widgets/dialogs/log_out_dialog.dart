// import 'package:flutter/material.dart';
// import 'package:moharekcustomer/providers/auth_provider.dart';
// import 'package:moharekcustomer/shared_preferences/shared_preferences_helper.dart';
// import 'package:moharekcustomer/utils/app_colors.dart';
// import 'package:provider/provider.dart';

// class LogoutDialog extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0))),
//       title: Text(
//         "هل تريد تسجيل الخروج؟",
//         style: TextStyle(
//             color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//       actions: [
//         FlatButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text(
//             'إلغاء',
//             style: TextStyle(
//                 color: mainAppColor, fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//         ),
//         FlatButton(
//           onPressed: () {
//                 authProvider.setCurrentUser(null);
//     SharedPreferencesHelper.remove("user");
//             Navigator.pop(context);

//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/login_screen', (Route<dynamic> route) => false);
//           },
//           child: Text(
//             'موافق',
//             style: TextStyle(
//                 color: mainAppColor, fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
// }
