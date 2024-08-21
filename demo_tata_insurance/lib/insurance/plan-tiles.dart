// / ignore_for_file: file_names

import 'package:flutter/material.dart';

class PlanTile extends StatelessWidget {
  const PlanTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.only(left: 78.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Chip(
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
                label: Text('Recommended'),
              ),
            ),
          ),

          const SizedBox(height: 20),

          //Title

          const Text(
            "MediCare Premier",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),

          //Feature Section

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: 150,
                height: 30,
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
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'OPD Treatment',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: 210,
                height: 30,
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
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '100% Hospitals bills paid',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('& 30+ more benefits'),
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
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),

          //Hyperlink

          //Apply Now Button
        ],
      ),
    );
  }
}
