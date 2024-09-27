import 'dart:convert';

import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/proposal.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../utils/validations.dart';
import 'components/custom_date_picker.dart';
import 'components/custom_dropdown.dart';
import 'components/custom_stepper.dart';
import 'components/floating_action_btn.dart';

// import '../components/health_overview/questions_card.dart';

class NomineeDetails extends StatefulWidget {
  final bool goback;
  const NomineeDetails({super.key, this.goback = false});

  @override
  State<NomineeDetails> createState() => _NomineeDetailsState();
}

class _NomineeDetailsState extends State<NomineeDetails> {
  final _formKey = GlobalKey<FormState>();
  String? relationship;
  String? name;
  String? dob;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    try {
      var nominee = await loadStoredValue('nominee');
      if (nominee.isNotEmpty) {
        var _nominee = jsonDecode(nominee);
        name = _nominee['name'];
        relationship = _nominee['relationship'];
        dob = _nominee['dob'];
        selectedDate = DateTime.parse(_nominee['selectedDate']!);
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
          title: Image.asset(
            'assets/tata-logo.png',
            width: 100,
            height: 60,
          ),
          actions: const <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints(maxWidth: 350),
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                children: [
                  const CustomStepper(currentStep: 3),
                  SizedBox(height: 30),
                  Card(
                    elevation: 8,
                    margin: const EdgeInsets.only(bottom: 24.0),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 40),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              (name == null)
                                  ? new NominieeFormm(
                                      relationship: relationship,
                                      name: name,
                                      dob: dob,
                                      selectedDate: selectedDate,
                                      onRelationSelected: _onRelationSelected,
                                      onNameChanged: _onNameChanged,
                                      onDateSelected: _onDateSelected,
                                    )
                                  : new NominieeForm(
                                      relationship: relationship,
                                      name: name,
                                      dob: dob,
                                      selectedDate: selectedDate,
                                      onRelationSelected: _onRelationSelected,
                                      onNameChanged: _onNameChanged,
                                      onDateSelected: _onDateSelected,
                                    ),
                              const SizedBox(height: 56),
                              GradientButton(
                                onPressed: _submitForm,
                                text: 'Cofirm & Proceed',
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionBtn());
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final _profile = {
        'name': name,
        'relationship': relationship,
        'dob': dob.toString(),
        'selectedDate': selectedDate.toString(),
      };
      storeValue('nominee', jsonEncode(_profile));

      widget.goback
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProposalPage(),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProposalPage(),
              ),
            );
    }
  }

  void _onRelationSelected(String value) {
    relationship = value;
  }

  void _onDateSelected(DateTime date, String formattedDate) {
    selectedDate = date;
    dob = formattedDate;
  }

  void _onNameChanged(String value) {
    name = value;
  }
}

class NominieeForm extends StatelessWidget {
  final String? relationship;
  final String? name;
  final String? dob;
  final DateTime? selectedDate;
  final Function(String) onRelationSelected;
  final Function(String) onNameChanged;
  final Function(DateTime, String) onDateSelected;
  const NominieeForm(
      {super.key,
      this.relationship,
      this.name,
      this.dob,
      this.selectedDate,
      required this.onRelationSelected,
      required this.onNameChanged,
      required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nominee Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        const Text(
          'Provide nominee details',
          style: TextStyle(
              fontSize: 10,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 40.0),
        LoginTextBox(
            labelText: "Nominee name",
            initialValue: name,
            onChanged: onNameChanged,
            validator: (value) =>
                validateString(value, 'Please enter nominee name')),
        const SizedBox(height: 20),
        CustomDatePicker(
          label: 'Select date of birth',
          onDateSelected: onDateSelected,
          validate: (value) =>
              validateString(value, 'Please select your date of birth'),
          initialDate: selectedDate,
        ),
        const SizedBox(height: 20),
        CustomDropdown(
          label: 'Relationship',
          onSelected: onRelationSelected,
          initialValue: relationship,
          items: [
            'Father',
            'Mother',
            'Spouse',
            'Son',
            'Daughter',
            'Brother',
            'Sister',
            'Other',
          ],
        ),
        const SizedBox(height: 40),
        Text("+ Nominee details",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2B62AA))),
      ],
    );
  }
}

class NominieeFormm extends StatelessWidget {
  final String? relationship;
  final String? name;
  final String? dob;
  final DateTime? selectedDate;
  final Function(String) onRelationSelected;
  final Function(String) onNameChanged;
  final Function(DateTime, String) onDateSelected;
  const NominieeFormm(
      {super.key,
      this.relationship,
      this.name,
      this.dob,
      this.selectedDate,
      required this.onRelationSelected,
      required this.onNameChanged,
      required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nominee Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        const Text(
          'Provide nominee details',
          style: TextStyle(
              fontSize: 10,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 40.0),
        LoginTextBox(
            labelText: "Nominee name",
            initialValue: name,
            onChanged: onNameChanged,
            validator: (value) =>
                validateString(value, 'Please enter nominee name')),
        const SizedBox(height: 20),
        CustomDatePicker(
          label: 'Select date of birth',
          onDateSelected: onDateSelected,
          validate: (value) =>
              validateString(value, 'Please select your date of birth'),
          initialDate: selectedDate,
        ),
        const SizedBox(height: 20),
        CustomDropdown(
          label: 'Relationship',
          onSelected: onRelationSelected,
          initialValue: relationship,
          items: [
            'Father',
            'Mother',
            'Spouse',
            'Son',
            'Daughter',
            'Brother',
            'Sister',
            'Other',
          ],
        ),
        const SizedBox(height: 40),
        Text("+ Nominee details",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2B62AA))),
      ],
    );
  }
}
