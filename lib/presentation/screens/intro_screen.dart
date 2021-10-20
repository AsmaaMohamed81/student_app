import 'package:flutter/material.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/utils/hex_color.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  Widget _buildBodyItem(
      {required BuildContext context,
      required double height,
      required double width}) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/splash_bg.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                height: height * 0.4,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Text(
                AppLocalizations.of(context)!.translate('place_you_learn')!,
                style: TextStyle(
                    color: HexColor("00557D"),
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                height: 55,
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: 20),
                child: Builder(
                  builder: (context) => ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/welcom_screen'),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: HexColor('FFC844'),
                      ),
                      child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Lets Get Started!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ))),
                )),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBodyItem(context: context, height: height, width: width),
    );
  }
}
