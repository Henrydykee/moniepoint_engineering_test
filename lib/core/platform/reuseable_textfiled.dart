

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moniepoint_test/core/platform/color.dart';

class ReusableTextField extends StatelessWidget {
  final String? hinttitle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final Color? cursorColor;
  final Color? fillColor;
  final bool? readOnly;
  final double? fontSize;
  final String? value;
  final bool? obscureText;
  final Function()? onTap;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Function(String)? onChange;

  const ReusableTextField(
      {super.key, this.onTap,
        this.maxLength,
        this.obscureText = false,
        this.hinttitle,
        this.controller,
        this.keyboardType,
        this.prefix,
        this.maxLines,
        this.suffixIcon,
        this.inputFormatters,
        this.currentFocusNode,
        this.nextFocusNode,
        this.cursorColor,
        this.readOnly = false,
        this.fontSize,
        this.onChange,
        this.fillColor,
        this.value,
        this.prefixIcon,
        this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      autofocus: false,
      onChanged: onChange,
      controller: controller,
      maxLength: maxLength,
      validator: validator,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: cursorColor ?? TestColor.eerieBlack,
      focusNode: currentFocusNode,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
      },
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
      },
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          counterText: "",
          fillColor: fillColor ?? Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: TestColor.eerieBlack.withOpacity(0.5)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: TestColor.eerieBlack.withOpacity(0.5)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: TestColor.eerieBlack.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: TestColor.eerieBlack.withOpacity(0.5)),
          ),
          hintText: hinttitle,
          helperStyle:
          TextStyle(color: TestColor.eerieBlack, fontSize: fontSize ?? 14)),
    );
  }
}