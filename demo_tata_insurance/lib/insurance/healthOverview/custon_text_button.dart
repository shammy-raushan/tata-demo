import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String option;
  final String selectedOption;
  final VoidCallback onPressed;
  final String text;

  CustomTextButton({
    required this.option,
    required this.selectedOption,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              option == selectedOption ? Color(0xFF51971D) : Colors.white,
          foregroundColor:
              option == selectedOption ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
            side: BorderSide(color: Colors.grey, width: 0.5),
          ),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 14.0)),
      ),
    );
  }
}
