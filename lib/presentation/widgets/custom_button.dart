import 'package:flutter/material.dart';
import 'package:student_app/utils/app_colors.dart';


class CustomButton extends StatelessWidget {
  final bool horizontalMarginIsEnabled;
  final bool verticalMarginIsEnabled;
  final Color? btnColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;
  final String btnLbl;
  final Function()? onPressedFunction;
  final TextStyle? btnLblStyle;
  final Widget? prefixIcon;
  final Widget? postfixIcon;
  final bool hasGradientColor;


  final double? height;
  final double? width;


  const CustomButton(
      {Key? key,
      required this.btnLbl,
      this.borderRadius,
      this.horizontalMarginIsEnabled= true,
      this.verticalMarginIsEnabled= true,
      this.onPressedFunction,
      this.btnColor,
      this.btnLblStyle,
      this.prefixIcon,
      this.hasGradientColor = false,
      this.postfixIcon,
      this.borderColor,
  
      this.height, this.width,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () => onPressedFunction!(),
      child: Container(
        width: width,
          height:height != null ? 50 :  height,
          margin: EdgeInsets.symmetric(
              horizontal: horizontalMarginIsEnabled ? 20 : 0.0,
              vertical: verticalMarginIsEnabled ? 10 : 0),
          decoration: hasGradientColor
              ? BoxDecoration(
                borderRadius:   BorderRadius.circular(35.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1C608D),
                      Color(0xff3192D9),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                
                    )
              : BoxDecoration(
                  color: btnColor ?? mainAppColor,
                  border: Border.all(
                    width: 1.0,
                    color: borderColor != null
                        ? borderColor!
                        : btnColor != null
                            ? btnColor!
                            : mainAppColor,
                  ),
                  borderRadius: borderRadius != null ? borderRadius!:
                   BorderRadius.circular(
                           10.0)),
          alignment: Alignment.center,
          child: prefixIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    prefixIcon!,
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          btnLbl,
                          textAlign: TextAlign.center,
                          style: btnLblStyle ?? Theme.of(context).textTheme.button,
                        ))
                  ],
                )
              : postfixIcon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              btnLbl,
                              textAlign: TextAlign.center,
                              style: btnLblStyle ?? Theme.of(context).textTheme.button,
                            )),
                        postfixIcon!
                      ],
                    )
                  : Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        btnLbl,
                        textAlign: TextAlign.center,
                        style: btnLblStyle ?? Theme.of(context).textTheme.button,
                      ))),
    );
  }
}
