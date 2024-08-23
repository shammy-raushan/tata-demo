import 'package:demo_tata_insurance/insurance/healthOverview/questions_card.dart';
import 'package:demo_tata_insurance/insurance/healthOverview/sample_values.dart';
import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:flutter/material.dart';

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
                Card(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nominee Details',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),

                        const Text('Secure your dependents',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey,fontWeight: FontWeight.w300),),
                        
                        const SizedBox(height: 40.0),
                        TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                            labelText: "Nominee name",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            filled: true, //<-- SEE HERE
                            fillColor: Color.fromARGB(255, 247, 246, 246),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          autofocus: false,
                          // initialValue: "2,50,000cccc",
                          decoration: const InputDecoration(
                            labelText: "Date of birth",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            filled: true, //<-- SEE HERE
                            fillColor: Color.fromARGB(255, 247, 246, 246),
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          autofocus: false,
                          // initialValue: "2,50,000cccc",
                          decoration: const InputDecoration(
                            labelText: "Relationship",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            filled: true, //<-- SEE HERE
                            fillColor: Color.fromARGB(255, 247, 246, 246),
                          ),
                        ),
                        const SizedBox(height: 40),

                        GradientButton(
                          onPressed: () {},
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
