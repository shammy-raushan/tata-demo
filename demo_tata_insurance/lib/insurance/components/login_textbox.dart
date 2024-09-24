// custom_text_form_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextBox extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool autofocus;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  LoginTextBox(
      {required this.labelText,
      this.controller,
      this.autofocus = false,
      this.textStyle,
      this.decoration,
      this.validator,
      this.keyboardType,
      this.maxLength,
      this.obscureText = false,
      this.suffixIcon,
      this.readOnly = false,
      this.onTap,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        autofocus: autofocus,
        validator: validator,
        keyboardType: keyboardType,
        maxLength: maxLength,
        readOnly: readOnly,
        onTap: onTap,
        inputFormatters: inputFormatters,
        style: textStyle ??
            TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF000000),
            ),
        decoration: decoration ??
            InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: Color(0xFF787878), fontSize: 14),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                borderSide: BorderSide(
                  color: Color(0xFFE9E9E9),
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                borderSide: BorderSide(
                  color: Color(0xFFE9E9E9),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                borderSide: BorderSide(
                  color: Color(0xFFE9E9E9),
                  width: 1.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffixIcon,
            ),
      ),
    );
  }
}
