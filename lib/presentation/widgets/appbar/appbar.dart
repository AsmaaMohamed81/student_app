import 'package:flutter/material.dart';
import 'package:student_app/utils/app_colors.dart';


class AppBarCustom {
  final String title;
  final GlobalKey<ScaffoldState> keyScafold;
  final Function()? backarrow;

  const AppBarCustom({required this.title, required this.keyScafold, required this.backarrow});

  Widget appBarCustom() {
    return AppBar(
      centerTitle: true,
      backgroundColor: mainAppColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      )),
      leading: GestureDetector(
          onTap: () => keyScafold.currentState!.openDrawer(),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          )),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }

  PreferredSizeWidget? buildAppBarRow() {
    return AppBar(
      centerTitle: true,

      backgroundColor: Colors.white,
      elevation: 0,

      leading: GestureDetector(
          onTap: backarrow,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      //  Image.asset(
      //   'assets/images/menu.png',
      //   color: Colors.white,
      // )),

      title: Text(
        title,
        style: const TextStyle(fontSize: 17, color: Colors.black),
      ),
      actions: <Widget>[
        // GestureDetector(
        //   // onTap: () => Navigator.pop(context),
        //   child: Stack(
        //     children: <Widget>[
        //       Column(children: <Widget>[
        //         Container(
        //           margin: EdgeInsets.only(left: 10, right: 10, top: 22),
        //           height: 25,
        //           width: 25,
        //           child: Icon(
        //             Icons.search,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ])
        //     ],
        //   ),
        // )
      ],
    );
  }
}
