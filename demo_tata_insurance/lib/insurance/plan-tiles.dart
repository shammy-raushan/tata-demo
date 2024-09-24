// / ignore_for_file: file_names

import 'package:demo_tata_insurance/insurance/healthOverview/health_overview.dart';
import 'package:flutter/material.dart';

import 'components/submit_button.dart';

class PlanTile extends StatelessWidget {
  final int index;
  final int currentStep;
  final Map<String, dynamic> planData;
  const PlanTile(
      {super.key,
      required this.index,
      required this.planData,
      required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade900),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          (index == 2)
              ? Container(
                  width: double.infinity,
                  height: 51,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF32A2CA), // #32A2CA
                        Color(0xFF2B62AA), // #2B62AA
                      ],
                      stops: [0.0, 0.75], // 0% and 75%
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Text("Recommended",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                )
              : SizedBox(height: 31),

          const SizedBox(height: 12),

          //Title

          Text(
            planData['title'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: planData['features'].map<Widget>((feature) {
              return PlanChip(title: feature);
            }).toList(),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(planData['totalBenefits'],
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ),
          ),

          //Search Policy Bar
          TermSearchTextField(),
          Text(
            currentStep == 0
                ? planData['amountYearly']
                : planData['amountMonthly'],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

          //Hyperlink
          SizedBox(height: 25),
          Text(
            'View Plan Details',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900),
          ),

          //Apply Now Button
          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GradientButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthOverview(),
                  ),
                );
              },
              text: 'Apply Now',
            ),
          ),
        ],
      ),
    );
  }
}

class PlanChip extends StatelessWidget {
  final String title;
  const PlanChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue.withOpacity(0.10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check,
              size: 12,
              color: const Color.fromARGB(255, 9, 56, 127),
            ),
            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(color: Colors.blueAccent, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class TermSearchTextField extends StatelessWidget {
  const TermSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        onChanged: null,
        decoration: InputDecoration(
          labelText: 'Search within the policy',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF686873),
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0xFF686873),
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0xFF686873),
              width: 0.5,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 24.0,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
