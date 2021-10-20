import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/locale/app_localizations.dart';

class Error extends StatelessWidget {
  final String errorMessage;
  final Function()? onRetryPressed;
  const Error({Key? key, required this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            child: Text(AppLocalizations.of(context)!.translate('retry')!,
                style: const TextStyle(color: Colors.black)),
            onPressed: onRetryPressed,
          ),
        ],
      ),
    );
  }
}
