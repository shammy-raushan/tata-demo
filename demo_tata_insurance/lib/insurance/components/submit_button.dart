import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isDisabled;
  final double height;

  GradientButton(
      {required this.text,
      this.onPressed,
      this.isDisabled = false,
      this.height = 45});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: isDisabled
            ? null
            : LinearGradient(
                colors: [Color(0xFF32A2CA), Color(0xFF2B62AA)],
                stops: [0.0, 0.75],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        color: isDisabled ? Color(0xFFDBDBDE) : null,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          minimumSize: Size(double.infinity, 14),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: isDisabled ? Color(0xFF787878) : Colors.white,
              fontSize: 14),
        ),
      ),
    );
  }
}
