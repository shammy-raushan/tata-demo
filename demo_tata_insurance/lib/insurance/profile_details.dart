import 'package:demo_tata_insurance/insurance/components/gender_dropdown.dart';
import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/self.dart';
import 'package:demo_tata_insurance/utils/validations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_date_picker.dart';
import 'components/custom_stepper.dart';
import 'components/read_more_text.dart';
import 'components/submit_button.dart';

bool isChecked = false;

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String selectedOption = '1';
  bool _obscureText = true;

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
          Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const CustomSteppper(
                    currentStep: 1,
                  ),
                  SizedBox(height: 14),
                  SvgPicture.asset('assets/KycForm.svg'),
                ],
              )),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 224),
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      // shadowColor: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 350, // Set the maximum width here
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Profile details",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Let us get to know you better!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF787878),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                const Text(
                                  "Do you have your PAN handy?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF787878),
                                  ),
                                ),
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
                                      )
                                    : Column(
                                        children: [
                                          LoginTextBox(
                                            labelText: "PAN Number",
                                            obscureText: _obscureText,
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
                                          const SizedBox(height: 24),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Checkbox(
                                                value: isChecked,
                                                onChanged: _onChanged,
                                              ),
                                              Expanded(
                                                  child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xFF787878),
                                                    letterSpacing: 0.4,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'I authorize the Bank and its representatives to Call, SMS or communicate via WhatsApp regarding my application. ',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: 'Read More',
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              // Navigator.push(
                                                              //   context,
                                                              //   MaterialPageRoute(
                                                              //     builder: (context) =>
                                                              //         ProfileDetails(),
                                                              //   ),
                                                              // );
                                                            },
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          ),
                                          ReadMoreText(
                                            isChecked: isChecked,
                                            onChanged: _onChanged,
                                          )
                                        ],
                                      ),
                                const SizedBox(height: 20),
                                GradientButton(
                                  onPressed: _submitForm,
                                  isDisabled: selectedOption == '1'
                                      ? !isChecked
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
        ]));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelfSelection(),
        ),
      );
    }
  }

  void _onChanged(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  void _onGenderSelected(String gender) {
    print('Selected gender: $gender');
  }
}

class _WithoutPAN extends StatelessWidget {
  final Function(String) onGenderSelected;
  const _WithoutPAN({required this.onGenderSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextBox(
          labelText: "Full Name",
          validator: (value) => validateString(value, 'Please enter your name'),
        ),
        const SizedBox(height: 24),
        CustomDatePicker(
          label: 'Enter date of birth',
          onDateSelected: (date) {
            print(date);
          },
          validate: (value) =>
              validateString(value, 'Please select your date of birth'),
        ),
        const SizedBox(height: 24),
        GenderDropdown(
            label: 'Gender',
            onGenderSelected: onGenderSelected,
            initialValue: "Male"),
        const SizedBox(height: 24),
        LoginTextBox(
          labelText: "Pincode of where you live",
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: validatePincode,
        ),
        Text('The above pincode will be considered for quote generation',
            style: TextStyle(fontSize: 11, color: Color(0xFF787878))),
        const SizedBox(height: 10),
      ],
    );
  }
}
