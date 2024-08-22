import 'package:demo_tata_insurance/insurance/healthOverview/health_overview.dart';
import 'package:demo_tata_insurance/insurance/plan-tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class planspage extends StatefulWidget {
  const planspage({super.key});

  @override
  State<planspage> createState() => _planspageState();
}

class _planspageState extends State<planspage> {
  int? _sliding = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Image.asset(
          'assets/tata-logo.png',
          width: 100,
          height: 60,
        ),
        actions: const <Widget>[
          Icon(Icons.question_mark_rounded),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          //Progress Bar
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthOverview(),
                  ),
                );
              },
              child: Text("Next"),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //Title Text
          const Text(
            "We provide excellent\nplans tailored for you.",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          //Sliding Segment Button
          CupertinoSlidingSegmentedControl(
            onValueChanged: (int? newvalue) {
              setState(() {
                _sliding = newvalue;
              });
            },
            children: const {
              0: Text('Yearly'),
              1: Text('Monthly'),
            },
            groupValue: _sliding,
          ),

          const SizedBox(
            height: 30,
          ),

          //Slider Plan Section

          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (Context, index) {
                return PlanTile();
              },
            ),
          ),

          const SizedBox(height: 30),

          //Location Container
          
          Container(
            width: 280,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
