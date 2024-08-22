import 'package:demo_tata_insurance/insurance/healthOverview/questions_card.dart';
import 'package:demo_tata_insurance/insurance/nominee.dart';
import 'package:flutter/material.dart';

// import '../components/health_overview/questions_card.dart';
import 'sample_values.dart';
import 'submit_button.dart';

class HealthOverview extends StatefulWidget {
  const HealthOverview({super.key});

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
                Text('Tell us about your health',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Column(
                  children: health_overview_ques.asMap().entries.map((entry) {
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
                        builder: (context) => NomineeDetails(),
                      ),
                    );
                  },
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ));
  }
}
