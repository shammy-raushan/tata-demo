import 'dart:convert';

import 'package:demo_tata_insurance/insurance/components/custom_dropdown.dart';
import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/proposal.dart';
import 'package:demo_tata_insurance/insurance/self.dart';
import 'package:demo_tata_insurance/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/utils.dart';
import 'components/custom_date_picker.dart';
import 'components/custom_stepper.dart';
import 'components/floating_action_btn.dart';
import 'components/read_more_text.dart';
import 'components/submit_button.dart';
import 'pan_profile_details.dart';

class ProfileDetails extends StatefulWidget {
  final bool goback;
  const ProfileDetails({super.key, this.goback = false});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _panController = TextEditingController();
  bool _isChecked = false;
  String selectedOption = '1';
  String panNumber = '';
  String? name;
  String pincode = "";
  String? gender;
  String? dob;
  DateTime? selectedDate;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _loadvalues();
  }

  Future<void> _loadvalues() async {
    try {
      selectedOption = await loadStoredValue('panSeletedOption');
      panNumber = await loadStoredValue('panNumber');
      pincode = await loadStoredValue('pincode');
      var profile = await loadStoredValue('profile');
      if (profile.isNotEmpty) {
        var _profile = jsonDecode(profile);
        name = _profile['name'];
        gender = _profile['gender'];
        dob = _profile['dob'];
        selectedDate = DateTime.parse(_profile['selectedDate']!);
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
        body: Stack(children: <Widget>[
          Positioned.fill(
              child: Opacity(
            opacity: 0.04,
            child: Image.asset(
              'assets/pattern.png',
              fit: BoxFit.cover,
            ),
          )),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 23, right: 20, bottom: 20),
                child: Column(
                  children: [
                    CustomStepper(currentStep: 1),
                    SvgPicture.asset('assets/KycForm.svg'),
                    PhysicalModel(
                      color: Color.fromARGB(244, 255, 255, 255),
                      elevation: 8,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 350),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Profile details",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Let us get to know you better!",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF787878)),
                                ),
                                const SizedBox(height: 32),
                                const Text("Do you have your PAN handy?",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF787878))),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio<String>(
                                      value: '1',
                                      groupValue: selectedOption,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: (selectedOption == '1')
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                        color: Color(0xFF787878),
                                      ),
                                    ),
                                    SizedBox(width: 50),
                                    Radio<String>(
                                      value: '2',
                                      groupValue: selectedOption,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: (selectedOption == '2')
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                        color: Color(0xFF787878),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Don't have PAN handy? No problem, you can still get a quote!",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF787878),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                (selectedOption == '2')
                                    ? _WithoutPAN(
                                        onGenderSelected: _onGenderSelected,
                                        onDOBSelected: _onDOBSelected,
                                        onPincodeChanged: onPincodeChanged,
                                        onNameChanged: _onNameChanged,
                                        name: name ?? '',
                                        gender: gender ?? '',
                                        dob: dob ?? '',
                                        pincode: pincode,
                                        selectedDate: selectedDate,
                                      )
                                    : Column(
                                        children: [
                                          LoginTextBox(
                                            labelText: "PAN",
                                            controller: _panController,
                                            obscureText: _obscureText,
                                            validator: validatePAN,
                                            onChanged: (value) {
                                              panNumber = value.toUpperCase();
                                              setState(() {
                                                _panController.text =
                                                    value.toUpperCase();
                                                _panController.selection =
                                                    TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: _panController
                                                          .text.length),
                                                );
                                              });
                                            },
                                            textCapitalization:
                                                TextCapitalization.characters,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0xFF787878),
                                              ),
                                              onPressed:
                                                  _togglePasswordVisibility,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                              'Speed up your premium quote by using your PAN to pre-fill your details',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF787878))),
                                          const SizedBox(height: 54),
                                          ExpandableText(
                                            isChecked: _isChecked,
                                            onChanged: _onCheckboxChanged,
                                            fullText:
                                                'I hereby give my consent to TATA AIG to verify and obtain my identity/address proof.',
                                          ),
                                        ],
                                      ),
                                const SizedBox(height: 20),
                                GradientButton(
                                  onPressed: _submitForm,
                                  isDisabled: selectedOption == '1'
                                      ? !_isChecked
                                      : false,
                                  text: 'Next',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionBtn());
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      storeValue('panSeletedOption', selectedOption);
      storeValue('panNumber', panNumber);
      storeValue('pincode', pincode);
      final _profile = {
        'name': name ?? 'Nisarg Garg',
        'gender': gender ?? 'Male',
        'dob': dob ?? '01/05/1988',
        'selectedDate': selectedDate.toString(),
      };
      storeValue('profile', jsonEncode(_profile));

      widget.goback
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProposalPage()),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (selectedOption == '2')
                    ? SelfSelection()
                    : PanProfileDetails(),
              ),
            );
    }
  }

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  void _onGenderSelected(String value) {
    gender = value;
  }

  void _onDOBSelected(DateTime dob, String fornattedValue) {
    selectedDate = dob;
    this.dob = fornattedValue;
  }

  void onPincodeChanged(String value) {
    pincode = value;
  }

  void _onNameChanged(String value) {
    name = value;
  }
}

class _WithoutPAN extends StatelessWidget {
  final Function(String) onGenderSelected;
  final Function(String) onPincodeChanged;
  final Function(String) onNameChanged;
  final Function(DateTime, String) onDOBSelected;
  final String name;
  final String gender;
  final String dob;
  final String pincode;
  final DateTime? selectedDate;
  const _WithoutPAN(
      {required this.onGenderSelected,
      required this.onDOBSelected,
      required this.onPincodeChanged,
      required this.onNameChanged,
      required this.name,
      required this.gender,
      required this.dob,
      required this.pincode,
      required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginTextBox(
          labelText: "Full Name",
          validator: (value) => validateString(value, 'Please enter your name'),
          onChanged: onNameChanged,
          initialValue: name,
        ),
        const SizedBox(height: 24),
        CustomDatePicker(
          label: 'Select date of birth',
          onDateSelected: onDOBSelected,
          validate: (value) =>
              validateString(value, 'Please select your date of birth'),
          initialDate: selectedDate,
        ),
        const SizedBox(height: 24),
        CustomDropdown(
          label: 'Gender',
          onSelected: onGenderSelected,
          hintTitle: 'Select Gender',
          initialValue: gender.isEmpty ? "Male" : gender,
          items: ['Male', 'Female', 'Other'],
        ),
        const SizedBox(height: 24),
        LoginTextBox(
          maxLength: 6,
          onChanged: onPincodeChanged,
          labelText: "Pincode of where you live",
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: validatePincode,
          initialValue: pincode,
        ),
        Text('The above pincode will be considered for quote generation',
            style: TextStyle(fontSize: 11, color: Color(0xFF787878))),
        const SizedBox(height: 10),
      ],
    );
  }
}
