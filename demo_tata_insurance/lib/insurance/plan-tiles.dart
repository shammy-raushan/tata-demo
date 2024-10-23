// / ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'components/submit_button.dart';
import 'plan_addons.dart';
import 'plan_details.dart';

class PlanTile extends StatelessWidget {
  final int index;
  final int currentStep;
  final bool gotoProposal;
  final int sliding;
  final Map<String, dynamic> planData;
  const PlanTile(
      {super.key,
      required this.index,
      required this.planData,
      required this.currentStep,
      required this.gotoProposal,
      required this.sliding});

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
          (index == 1)
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
          TermSearchTextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetails(index: index),
                  ),
                );
              },
              labelText: 'Search within the policy',
              hintText: ""),
          Text(
            currentStep == 0
                ? "${formatCurrency(planData["amountYearly"])}/year incl GST"
                : "${formatCurrency(planData['amountMonthly'])}/month incl GST",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 15),
          (index == 1 && sliding == 1) ? _CibilCard() : SizedBox(),
          //Hyperlink
          SizedBox(height: 15),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlanDetails(index: index),
              ),
            ),
            child: Text(
              'View Plan Details',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade900),
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GradientButton(
              onPressed: () {
                storeValue('selectedPlan', index.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlanAddons(goback: true, gotoProposal: gotoProposal)),
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
        margin: const EdgeInsets.only(left: 10, bottom: 10, right: 20),
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
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.blueAccent, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermSearchTextField extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final GestureTapCallback onTap;
  const TermSearchTextField(
      {super.key, required this.onTap, this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        onChanged: null,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) {
          if (value != "") onTap();
        },
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
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
          prefixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/search.png'),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _CibilCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0xFF254A9E), width: 1),
            color: Color(0xFFE7EEFB)),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 9.0),
        child: Row(
          children: [
            Image.asset("discount.png"),
            SizedBox(width: 15),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Looking to reduce your premium further?\n",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: "Check your CIBIL score ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: "to get an extra discount on your premium.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
