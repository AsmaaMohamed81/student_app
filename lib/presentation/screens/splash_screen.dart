import 'package:flutter/material.dart';
import 'package:student_app/utils/hex_color.dart';

import 'main_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future initData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

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
    initData().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyItem(),
    );
  }
}
