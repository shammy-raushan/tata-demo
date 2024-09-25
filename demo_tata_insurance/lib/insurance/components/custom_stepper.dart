import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  final currentStep;
  final double progress;
  const CustomStepper({super.key, this.currentStep, this.progress = 0.6});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  List<String> _labels = [
    'Profile',
    'Plan',
    'Proposal',
    'Payment',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 385),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int step = 1; step <= _labels.length; step++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_labels[step - 1],
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 10,
                  child: LinearProgressIndicator(
                    value: step <= widget.currentStep ? widget.progress : 0.0,
                    backgroundColor: Color(0xFFC9C9C9),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF00AE4E),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: 14),
              ],
            ),
        ],
      ),
    );
  }
}
