import 'package:demo_tata_insurance/insurance/plan-tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/custom_stepper.dart';

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
        body: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
              opacity: 0.04,
              child: Image.asset(
                'assets/pattern.png',
                fit: BoxFit.cover,
              ),
            )),
            SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 10),
                const CustomSteppper(currentStep: 2),
                const SizedBox(height: 20),
                const Text(
                  "We provide excellent\nplans tailored for you.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 24),

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
                  height: 24,
                ),

                Container(
                  height: 505,
                  child: ListView.builder(
                    itemCount: samplePlans.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (Context, index) {
                      return PlanTile(
                        index: index,
                        planData: samplePlans[index],
                      );
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
            )),
          ],
        ));
  }
}

const List<Map<String, dynamic>> samplePlans = [
  {
    'title': 'MediCare Basic',
    'features': [
      'Inpatient Coverage',
      '20% off on Medicines',
    ],
    'discount': '5,000/year incl GST',
    'totalBenefits': '& 15 benefits in total',
  },
  {
    'title': 'MediCare Plus',
    'features': [
      'OPD Treatment',
      '50% off on Hospital Bills',
      'Additional Wellness Programs',
    ],
    'discount': '8,500/year incl GST',
    'totalBenefits': '& 22 benefits in total',
  },
  {
    'title': 'MediCare Elite',
    'features': [
      'Full Hospitalization Coverage',
      'Free Annual Health Check-ups',
      'Access to Private Rooms',
    ],
    'discount': '12,500/year incl GST',
    'totalBenefits': '& 35 benefits in total',
  },
  {
    'title': 'MediCare Advanced',
    'features': [
      'Comprehensive Inpatient Coverage',
      'High Coverage on Medicines',
      'Family Health Benefits',
    ],
    'discount': '9,200/year incl GST',
    'totalBenefits': '& 28 benefits in total',
  },
  {
    'title': 'MediCare Essential',
    'features': [
      'Basic OPD Treatment',
      'Emergency Services',
      'Discounted Specialist Consultations',
    ],
    'discount': '6,800/year incl GST',
    'totalBenefits': '& 18 benefits in total',
  },
];
