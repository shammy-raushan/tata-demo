import 'package:demo_tata_insurance/insurance/healthOverview/questions_card.dart';
import 'package:demo_tata_insurance/insurance/nominee.dart';
import 'package:demo_tata_insurance/insurance/proposal.dart';
import 'package:flutter/material.dart';

import '../components/custom_stepper.dart';
import '../../utils/sample_values.dart';
import '../components/submit_button.dart';

class HealthOverview extends StatefulWidget {
  final bool goback;
  const HealthOverview({super.key, this.goback = false});

  @override
  State<HealthOverview> createState() => _HealthOverviewState();
}

class _HealthOverviewState extends State<HealthOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/tata-logo.png',
            width: 100,
            height: 60,
          ),
          actions: const <Widget>[],
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
              child: Opacity(
            opacity: 0.04,
            child: Image.asset('assets/pattern.png', fit: BoxFit.cover),
          )),
          Positioned.fill(
              child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 44, 0, 30),
                constraints: BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomStepper(currentStep: 3),
                    SizedBox(height: 30),
                    Text('Tell us about your health',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Column(
                      children:
                          health_overview_ques.asMap().entries.map((entry) {
                        int index = entry.key;
                        var question = entry.value;
                        return QuestionsCard(
                          data: question,
                          index: index,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 40),
                    GradientButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => widget.goback
                                ? ProposalPage()
                                : NomineeDetails(),
                          ),
                        );
                      },
                      text: 'Continue',
                    ),
                  ],
                ),
              ),
            ),
          ))
        ]));
  }
}
