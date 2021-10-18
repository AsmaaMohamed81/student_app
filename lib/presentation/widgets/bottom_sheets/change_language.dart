// import 'package:flutter/material.dart';
// import 'package:moharekcustomer/custom_widgets/buttons/custom_button.dart';
// import 'package:moharekcustomer/locale/app_localizations.dart';

// class ChangeLanguage extends StatelessWidget {
//   const ChangeLanguage({Key? key}) : super(key: key);

//   Widget _buildBodyItem(BuildContext context) {
//     return Container(
//       height: 240,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(40), topLeft: Radius.circular(40))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Container(
//               height: 80,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40)),
//               ),
//               child: Center(
//                 child: Text(
//                   AppLocalizations.of(context)!.translate('arabic')!,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Fairuz',
//                     color: Color(0xff4C5264),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(

//               child: Container(
//                 height: 80,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: Text(
//                     'English',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Fairuz',
//                       color: Color(0xff4C5264),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: CustomButton(
//               height: 80,
//               verticalMarginIsEnabled: false,
             
//               hasGradientColor: true,
//               btnLbl: 'الغاء',
//               btnColor: Colors.white,
//               // isOneSideBorder: true,
//               // topRight: 30,
//               // topLeft: 30,
//               horizontalMarginIsEnabled: false,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildBodyItem(context);
//   }
// }
