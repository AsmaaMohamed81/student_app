import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:student_app/utils/app_colors.dart';


class CustomDropdownButtonFormField extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final String? hint;
  final dynamic value;
  final TextStyle? errorStyle;
  final double? radius;
  final bool borderIsEnabled;
  final bool horizontalMarginIsEnabled;
  final bool? enabled;
  final String? initialValue;
  final String? hintTxt;
  final TextInputType? inputData;
  final String? Function(dynamic)? validationFunction;
  final   Function(dynamic)? onChangedFunction;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool suffixIconIsImage;
  final String? suffixIconImagePath;
  final Widget? icon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final bool prefixIconIsImage;
  final String? prefixIconImagePath;
  final String? labelTxt;
  final bool isExpanded;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextEditingController? controller;
  final Color? unfocusColor;
  final Color? hintColor;
  final Color? focusColor;
  final bool filled;
  final List<MaskTextInputFormatter>? inputFormatters;

  const CustomDropdownButtonFormField(
      {Key? key,
      required this.items,
      this.borderIsEnabled = true,
      this.hint,
      this.value,
      this.icon,
      this.errorStyle,
      this.radius,
      this.horizontalMarginIsEnabled = true,
      this.enabled,
      this.initialValue,
      this.hintTxt,
      this.inputData,
      this.validationFunction,
      this.onChangedFunction,
      this.suffix,
      this.suffixIcon,
      this.suffixIconIsImage = false,
      this.suffixIconImagePath,
      this.prefix,
      this.prefixIcon,
      this.prefixIconIsImage = false,
      this.prefixIconImagePath,
      this.labelTxt,
      this.isExpanded = true,
      this.verticalPadding,
      this.horizontalPadding,
      this.controller,
      this.unfocusColor,
      this.hintColor,
      this.focusColor,
      this.filled = true,
      this.inputFormatters})
      : super(key: key);
  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();

    super.dispose();
  }

  Widget _buildDropdownButtonFormField() {
    return DropdownButtonFormField(
     // isDense: false,
     // itemHeight: 48,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      icon: widget.icon ?? Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.grey[500],
            ),
      style: const TextStyle(
            fontFamily: 'Fairuz',
          color: Color(0xff4C5264),
          fontSize: 12,
          fontWeight: FontWeight.w500),
      value: widget.value,
      isExpanded: widget.isExpanded,
      decoration: InputDecoration(
        filled: widget.filled ? true : false,
        fillColor: const Color(0xffF8F8F8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              widget.radius == null ? 8.0 : widget.radius!),
          borderSide: BorderSide(
              color: _focusNode.hasFocus
                  ? widget.focusColor != null
                      ? widget.focusColor!
                      : mainAppColor
                  : widget.unfocusColor != null
                      ? widget.unfocusColor!
                      : hintColor),
        ),
        enabledBorder: !widget.borderIsEnabled
            ? InputBorder.none
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              widget.radius == null ? 8.0 : widget.radius!),
          borderSide: BorderSide(
              color: _focusNode.hasFocus
                  ? widget.focusColor != null
                      ? widget.focusColor!
                      : mainAppColor
                  : widget.unfocusColor != null
                      ? widget.unfocusColor!
                      : hintColor),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding == null
                ? 12.0
                : widget.horizontalPadding!,
            vertical:
                widget.verticalPadding == null ? 12.0 : widget.verticalPadding!),
        suffix: widget.suffix,
        suffixIcon: !widget.suffixIconIsImage
            ? widget.suffixIcon
            : _focusNode.hasFocus
                ? Image.asset(
                    widget.suffixIconImagePath!,
                    color: mainAppColor,
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    widget.suffixIconImagePath!,
                    color: Colors.grey,
                    height: 25,
                    width: 25,
                  ),
        prefix: widget.prefix,
        prefixIcon: !widget.prefixIconIsImage
            ? widget.prefixIcon
            : _focusNode.hasFocus
                ? Image.asset(
                    widget.prefixIconImagePath!,
                    color: mainAppColor,
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    widget.prefixIconImagePath!,
                    color: hintColor,
                    height: 25,
                    width: 25,
                  ),
        hintText: widget.hintTxt,
        labelText: widget.labelTxt,
        labelStyle: TextStyle(
            color: const Color(0xff0D0D0F).withOpacity(0.5),
            fontSize: 12,
            fontWeight: FontWeight.bold),
        errorStyle: widget.errorStyle ?? const TextStyle(fontSize: 12.0),
        hintStyle: TextStyle(
            color: _focusNode.hasFocus
                ? mainAppColor
                : widget.hintColor ?? const Color(0xff7F2C2D).withOpacity(0.5),
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
      onChanged: widget.onChangedFunction,
      items: widget.items,
      validator: widget.validationFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: widget.horizontalMarginIsEnabled ? 20 : 0),
        child: _buildDropdownButtonFormField());
  }
}
