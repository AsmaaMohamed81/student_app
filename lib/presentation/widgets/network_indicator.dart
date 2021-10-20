import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:student_app/locale/app_localizations.dart';

class NetworkIndicator extends StatefulWidget {
  final Widget? child;
  const NetworkIndicator({Key? key, this.child}) : super(key: key);
  @override
  _NetworkIndicatorState createState() => _NetworkIndicatorState();
}

class _NetworkIndicatorState extends State<NetworkIndicator> {
  double _width = 0;

  Widget _buildBodyItem() {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Icon(
              Icons.signal_wifi_off,
              size: 120,
              color: Colors.grey[400],
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('sorry..no_internet_connection')!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Fairuz',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!.translate('check_your_router')!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontFamily: 'Fairuz',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('reconnect_to_network')!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontFamily: 'Fairuz',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                height: 50,
                margin: EdgeInsets.symmetric(
                    horizontal: _width * 0.25, vertical: 10),
                child: Builder(
                    builder: (context) => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 500,
                            onPrimary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('refresh_screen')!,
                                style: const TextStyle(
                                    fontFamily: 'Fairuz',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0),
                              )),
                        )))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          final appBar = AppBar(
            leading: Container(),
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text(
              'محرك',
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Fairuz',
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
          );
          _width = MediaQuery.of(context).size.width;

          return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                appBar: appBar,
                body: _buildBodyItem(),
              ));
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return widget.child!;
      },
    );
  }
}
