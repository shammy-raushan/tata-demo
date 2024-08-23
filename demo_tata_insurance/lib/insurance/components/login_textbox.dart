// custom_text_form_field.dart
import 'package:flutter/material.dart';

class LoginTextBox extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool autofocus;
  final TextStyle? textStyle;
  final InputDecoration? decoration;

  LoginTextBox({
    required this.labelText,
    this.controller,
    this.autofocus = false,
    this.textStyle,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        style: textStyle ??
            TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF000000),
            ),
        decoration: decoration ??
            InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: Color(0xFF787878)),
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
            ),
      ),
    );
  }
}
