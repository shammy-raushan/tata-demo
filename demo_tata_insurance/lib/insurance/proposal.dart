import 'dart:convert';

import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/healthOverview/health_overview.dart';
import 'package:demo_tata_insurance/insurance/profile_details.dart';
import 'package:demo_tata_insurance/insurance/term_selection.dart';
import 'package:flutter/material.dart';

import '../utils/temp_values.dart';
import '../utils/utils.dart';
import 'components/custom_stepper.dart';
import 'nominee.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({super.key});

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  String? nominee;
  String? profile;
  String? panNumber;
  String mobileNumber = '';
  String termTenure = '1';
  String termAmount = '0';
  String termPaidBy = '0';
  String termAmountWithAddons = '0';
  String totalAddons = '0';
  String? pincode;
  String preExistingDisease = "No";
  String medicalHistory = "No";
  String insuranceDeclined = "No";
  String substance = "No";
  Map<String, dynamic> planData = {};

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    try {
      var _panNumber = await loadStoredValue('panNumber');
      if (_panNumber.isNotEmpty) panNumber = _panNumber;
      var _mobileNumber = await loadStoredValue('mobileNumber');
      if (_mobileNumber.isNotEmpty) mobileNumber = _mobileNumber;
      var _termTenure = await loadStoredValue('termTenure');
      if (_termTenure.isNotEmpty) termTenure = _termTenure;
      var _termAmount = await loadStoredValue('termAmount');
      if (_termAmount.isNotEmpty) termAmount = _termAmount;
      var _pincode = await loadStoredValue('pincode');
      if (_pincode.isNotEmpty) pincode = _pincode;
      var _termPaidBy = await loadStoredValue('termPaidBy');
      if (_termPaidBy.isNotEmpty) termPaidBy = _termPaidBy;
      var _termAmountWithAddons = await loadStoredValue('termAmountWithAddons');
      if (_termAmountWithAddons.isNotEmpty)
        termAmountWithAddons = _termAmountWithAddons;
      var _totalAddons = await loadStoredValue('selectedAddons');
      if (_totalAddons.isNotEmpty)
        totalAddons = jsonDecode(_totalAddons).length.toString();
      profile = await loadStoredValue('profile');
      var _selectedPlan = await loadStoredValue('selectedPlan');
      planData =
          samplePlans[_selectedPlan.isEmpty ? 0 : int.parse(_selectedPlan)];
      var _preExistingDisease = await loadStoredValue('preExistingDisease');
      preExistingDisease = (_preExistingDisease == "Yes") ? "Yes" : "No";
      var _medicalHistory = await loadStoredValue('medicalHistory');
      medicalHistory = (_medicalHistory == "Yes") ? "Yes" : "No";
      var _insuranceDeclined = await loadStoredValue('insuranceDeclined');
      insuranceDeclined = (_insuranceDeclined == "Yes") ? "Yes" : "No";
      var _substance = await loadStoredValue('substance');
      substance = (_substance == "Yes") ? "Yes" : "No";
      nominee = await loadStoredValue('nominee');
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Image.asset(
            'assets/tata-logo.png',
            width: 100,
            height: 60,
          ),
        ),
        body: SingleChildScrollView(
            child: Align(
          alignment: Alignment.center,
          child: Container(
              constraints: BoxConstraints(maxWidth: 350),
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomStepper(currentStep: 3, progress: 0.7),
                    SizedBox(height: 40),
                    const Text(
                      "Review your application",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Image.asset('assets/proposal.png'),
                    if (profile!.isNotEmpty)
                      _ProfileDetails(
                          panNumber: panNumber,
                          mobileNumber: mobileNumber,
                          data: jsonDecode(profile!),
                          pincode: pincode ?? ''),
                    _PlanDetails(
                      data: planData,
                      termPaidBy: termPaidBy,
                      termAmount: termAmount,
                      termAmountWithAddons: termAmountWithAddons,
                      totalAddons: totalAddons,
                    ),
                    _ApplicationDetails(data: [
                      preExistingDisease,
                      medicalHistory,
                      insuranceDeclined,
                      substance
                    ]),
                    if (nominee != null && nominee!.isNotEmpty && nominee != "")
                      _NomineeDetails(data: jsonDecode(nominee!)),
                    SizedBox(height: 30),
                    GradientButton(text: "Confirm & Proceed", onPressed: () {})
                  ])),
        )));
  }
}

class TextWithHeader extends StatelessWidget {
  final String title;
  final String text;
  const TextWithHeader({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _NomineeDetails extends StatelessWidget {
  final dynamic data;
  const _NomineeDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Nominee details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NomineeDetails(),
                      ),
                    )
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2B62AA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWithHeader(title: "Name", text: data["name"]),
                TextWithHeader(title: "DOB", text: data["dob"]),
              ],
            ),
            SizedBox(height: 30),
            TextWithHeader(title: "Relationship", text: data["relationship"]),
            SizedBox(height: 15),
          ]),
        ));
  }
}

class _ApplicationDetails extends StatelessWidget {
  final dynamic data;
  const _ApplicationDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Application",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HealthOverview(goback: true),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2B62AA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextWithHeader(
                title: "Has any pre-existing disease?", text: data[0]),
            SizedBox(height: 20),
            TextWithHeader(title: "Has any Medical History?", text: data[1]),
            SizedBox(height: 20),
            TextWithHeader(
                title:
                    "Been conditionally issued or declined health/life insurance?",
                text: data[2]),
            SizedBox(height: 20),
            TextWithHeader(
                title: "Smokes, consumes alcohol or any tobacco products?",
                text: data[3]),
            SizedBox(height: 15),
          ]),
        ));
  }
}

class _PlanDetails extends StatelessWidget {
  final dynamic data;
  final String termPaidBy;
  final String termAmount;
  final String termAmountWithAddons;
  final String totalAddons;
  const _PlanDetails(
      {this.data,
      required this.termPaidBy,
      required this.termAmount,
      required this.termAmountWithAddons,
      required this.totalAddons});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Plan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TermSelection(goback: true, gotoProposal: true),
                      ),
                    );
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2B62AA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF32A2CA), Color(0xFF2B62AA)],
                    stops: [0.0, 0.75],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Plan Name",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data["title"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithHeader(title: "Insurance for", text: "Self"),
                    SizedBox(height: 20),
                    TextWithHeader(
                      title: "Premium",
                      text: formatCurrency(termAmountWithAddons) +
                          (termPaidBy == '0' ? "/year" : "/month"),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithHeader(title: "Policy type", text: "Individual"),
                    SizedBox(height: 20),
                    TextWithHeader(
                      title: "Coverage amount",
                      text: '${formatCurrency(termAmount)}',
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            TextWithHeader(title: "Add Ons", text: totalAddons + " Selected"),
            SizedBox(height: 15),
          ]),
        ));
  }
}

class _ProfileDetails extends StatelessWidget {
  final String? panNumber;
  final String mobileNumber;
  final String pincode;
  final dynamic data;
  const _ProfileDetails(
      {this.panNumber,
      this.data,
      required this.pincode,
      required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                if (panNumber == null || panNumber!.isEmpty)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetails(goback: true),
                        ),
                      );
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2B62AA),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithHeader(title: "Name", text: data["name"]),
                    SizedBox(height: 20),
                    TextWithHeader(title: "Gender", text: data["gender"]),
                    SizedBox(height: 20),
                    TextWithHeader(title: "Mobile Number", text: mobileNumber),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithHeader(title: "DOB", text: data["dob"]),
                    SizedBox(height: 20),
                    TextWithHeader(title: "Pincode", text: pincode),
                    SizedBox(height: 20),
                    (panNumber == null || panNumber!.isNotEmpty)
                        ? TextWithHeader(title: "PAN", text: "XXXXXXXXXX")
                        : SizedBox(height: 50)
                  ],
                )
              ],
            ),
            SizedBox(height: 15),
          ]),
        ));
  }
}
