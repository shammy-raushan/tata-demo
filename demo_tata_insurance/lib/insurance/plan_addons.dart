import 'dart:convert';

import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:flutter/material.dart';

import '../utils/sample_values.dart';
import '../utils/temp_values.dart';
import '../utils/utils.dart';
import 'components/custom_stepper.dart';
import 'healthOverview/health_overview.dart';
import 'proposal.dart';

class PlanAddons extends StatefulWidget {
  final bool goback;
  final bool gotoProposal;
  const PlanAddons(
      {super.key, this.goback = false, required this.gotoProposal});

  @override
  State<PlanAddons> createState() => _PlanAddonsState();
}

class _PlanAddonsState extends State<PlanAddons> {
  List<int> selectedCards = [];
  String termPaidBy = '0';
  int termAmount = 0;
  int termAmountWithAddons = 0;

  @override
  void initState() {
    _loadDetails();
    super.initState();
  }

  Future<void> _loadDetails() async {
    try {
      String selectedPlan = await loadStoredValue('selectedPlan');
      var planData =
          samplePlans[selectedPlan.isEmpty ? 0 : int.parse(selectedPlan)];
      termPaidBy = await loadStoredValue('termPaidBy');
      termAmount = termPaidBy == '0'
          ? int.parse(planData['amountYearly'])
          : int.parse(planData['amountMonthly']);
      var tmwaon = await loadStoredValue('termAmountWithAddons');
      termAmountWithAddons =
          (tmwaon.isNotEmpty ? int.tryParse(tmwaon) : termAmount)!;

      var profile = await loadStoredValue('selectedAddons');
      if (profile.isNotEmpty) {
        var _profile = jsonDecode(profile);
        selectedCards = List<int>.from(_profile);
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/tata-logo.png', width: 100, height: 60),
          actions: const <Widget>[],
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
              child: Opacity(
            opacity: 0.04,
            child: Image.asset('assets/pattern.png', fit: BoxFit.cover),
          )),
          Positioned.fill(
              child: SingleChildScrollView(
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 44, 0, 30),
                          constraints: BoxConstraints(maxWidth: 350),
                          child: Column(children: [
                            const CustomStepper(currentStep: 2, progress: 0.8),
                            SizedBox(height: 30),
                            Text('Most Bought add-ons',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Column(
                              children: planAddons.asMap().entries.map((entry) {
                                int index = entry.key;
                                return AddOnsCard(
                                    index: index,
                                    data: planAddons[index],
                                    isChecked: selectedCards.contains(index),
                                    onChanged: onCardSelected);
                              }).toList(),
                            ),
                            SizedBox(height: 200),
                          ]))))),
          Positioned(
            bottom: 0,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFE7EEFB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  border: Border(
                      top: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                      left: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                      right: BorderSide(width: 1, color: Color(0xFFCCCCCC))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Premium Breakup",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2B62AA))),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: formatCurrency(termAmountWithAddons),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900)),
                          TextSpan(text: "/Year incl GST"),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                        width: 240,
                        child: GradientButton(
                            text: "Continue",
                            height: 35,
                            onPressed: () => widget.gotoProposal
                                ? Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProposalPage()),
                                    (Route<dynamic> route) => false)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HealthOverview()),
                                  ))),
                  ],
                )),
          )
        ]));
  }

  void onCardSelected(bool selected, int index) {
    int amount = int.parse(planAddons[index]['price']);
    setState(() {
      if (selected) {
        selectedCards.add(index);
        termAmountWithAddons += amount;
      } else {
        selectedCards.remove(index);
        termAmountWithAddons -= amount;
      }
    });
    storeValue('selectedAddons', jsonEncode(selectedCards));
    storeValue('termAmountWithAddons', termAmountWithAddons.toString());
  }
}

class AddOnsCard extends StatelessWidget {
  final int index;
  final bool isChecked;
  final dynamic data;
  final void Function(bool, int) onChanged;
  const AddOnsCard(
      {super.key,
      required this.isChecked,
      required this.onChanged,
      required this.index,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 24.0),
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) => {onChanged(value!, index)}),
                SizedBox(width: 6),
                Text(data['title'],
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ]),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("From " + formatCurrency(data['price']),
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              ),
              SizedBox(height: 20),
              Text(data['description'],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            ])));
  }
}
