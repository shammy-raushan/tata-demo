import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_stepper.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({super.key});

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Image.asset(
            'assets/tata-logo.png',
            width: 100,
            height: 60,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomStepper(currentStep: 3),
                      SizedBox(height: 40),
                      const Text(
                        "Proposal",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16),
                      SvgPicture.asset(
                        'assets/KycForm.svg',
                        width: 250,
                      ),
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    "MediCare Premier",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWithHeader(
                                          title: "Members", text: "Self"),
                                      TextWithHeader(
                                          title: "Policy type",
                                          text: "Individual")
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWithHeader(
                                          title: "Premium",
                                          text: "INR 8,552/year"),
                                      TextWithHeader(
                                          title: "Policy type", text: "INR 10L")
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                ]),
                          )),
                      SizedBox(height: 20),
                      Text("Edit",
                          style: TextStyle(
                              color: Color(0xFF2B62AA),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 20),
                      GradientButton(
                          text: "Confirm & Proceed", onPressed: () {})
                    ]))));
  }
}

class TextWithHeader extends StatelessWidget {
  final String title;
  final String text;
  const TextWithHeader({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
