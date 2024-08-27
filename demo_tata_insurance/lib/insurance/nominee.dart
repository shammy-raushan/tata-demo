import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/proposal.dart';
import 'package:flutter/material.dart';

import 'components/custom_stepper.dart';

// import '../components/health_overview/questions_card.dart';

class NomineeDetails extends StatefulWidget {
  const NomineeDetails({super.key});

  @override
  State<NomineeDetails> createState() => _NomineeDetailsState();
}

class _NomineeDetailsState extends State<NomineeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/tata-logo.png',
            width: 100,
            height: 60,
          ),
          actions: const <Widget>[
            Icon(Icons.pin_drop),
            Text("New Delhi",
                style: TextStyle(fontSize: 16, color: Colors.black)),
            SizedBox(width: 15),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSteppper(currentStep: 3),
                SizedBox(height: 30),
                Card(
                  elevation: 8,
                  margin: const EdgeInsets.only(bottom: 24.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nominee Details',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        const Text(
                          'Provide nominee details',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 40.0),
                        LoginTextBox(labelText: "Nominee name"),
                        const SizedBox(height: 20),
                        LoginTextBox(labelText: "Date of birth"),
                        const SizedBox(height: 20),
                        LoginTextBox(labelText: "Relationship"),
                        const SizedBox(height: 96),
                        GradientButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProposalPage(),
                              ),
                            );
                          },
                          text: 'Cofirm & Proceed',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
