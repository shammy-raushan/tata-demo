// / ignore_for_file: file_names

import 'package:demo_tata_insurance/insurance/healthOverview/custon_text_button.dart';
import 'package:flutter/material.dart';

import 'healthOverview/submit_button.dart';

class PlanTile extends StatelessWidget {
  const PlanTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Container(
        
        width: 280,
        margin: const EdgeInsets.only(left: 25),
        
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
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
      
            Container(
              width: double.infinity,
              height: 61,
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
              child: 
              Text("Recommended",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),
      
            const SizedBox(height: 20),
      
            //Title
      
            const Text(
              "MediCare Premier",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
      
            const SizedBox(height: 23),
      
            //Feature Section
      
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 150,
                  height: 24,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue.withOpacity(0.10),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 6),
                      Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'OPD Treatment',
                        style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 10),
      
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 210,
                  height: 24,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue.withOpacity(0.10),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 6),
                      Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '100% Hospitals bills paid',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 14),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('& 30+ more benefits',
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ),
            ),
      
            //Search Policy Bar
      
            Container(
              padding: const EdgeInsets.all(16),
              child: const TextField(
                onChanged: null,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            //Discount Text
      
            Text(
              '10,186/year incl GST',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
      
            //Hyperlink
            SizedBox(height: 27),
            Text(
              'View Plan Details',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade900),
            ),
      
            //Apply Now Button
            SizedBox(height: 30),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GradientButton(
                onPressed: () {},
                text: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
