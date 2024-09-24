import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CustomSteppper extends StatefulWidget {
  final int currentStep;

  const CustomSteppper({super.key, required this.currentStep});
  @override
  _CustomSteppperState createState() => _CustomSteppperState();
}

class _CustomSteppperState extends State<CustomSteppper> {
  int _currentStep = 1;

  @override
  void initState() {
    super.initState();
    _currentStep = widget.currentStep;
  }

  final List<String> _labels = [
    'Profile',
    'Plan',
    'Proposal',
    'Payment',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _labels.length,
              (index) => Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      _labels[index],
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          StepProgressIndicator(
            totalSteps: _labels.length,
            currentStep: _currentStep,
            size: 8,
            padding: 5,
            selectedColor: Color(0xFF00AE4E),
            unselectedColor: Color(0xFFC9C9C9),
            roundedEdges: Radius.circular(10),
          ),
        ],
      ),
    );
  }
}
