import 'package:demo_tata_insurance/insurance/questions_card.dart';
import 'package:flutter/material.dart';

// import '../components/health_overview/questions_card.dart';
import 'sample_values.dart';

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
                  children: health_overview_ques.map((question) {
                    return QuestionsCard(
                      data: question,
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                GradientButton(
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;

  GradientButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo.shade900],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
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
        onPressed: onPressed,
        child: Text(
          'Continue',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
