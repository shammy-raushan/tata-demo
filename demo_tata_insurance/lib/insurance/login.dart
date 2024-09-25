import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/components/read_more_text.dart';
import 'package:flutter/material.dart';

import 'components/submit_button.dart';
import 'otp.dart';

class TataLogin extends StatefulWidget {
  const TataLogin({super.key});

  @override
  State<TataLogin> createState() => _TataLoginState();
}

class _TataLoginState extends State<TataLogin> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

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
          Positioned(
            top: 0,
            left: -62,
            right: 0,
            child: Image.asset(
              'assets/banner.png',
              fit: BoxFit.cover,
              height: 350,
            ),
          ),
          Positioned.fill(
              child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(height: 240),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
                              "Let's Get Started!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 19),
                            const Text(
                              "Get your health insured in 5 min",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF787878),
                              ),
                            ),
                            const SizedBox(height: 29),
                            LoginTextBox(
                              labelText: 'Enter Mobile Number',
                              validator: _validateMobileNumber,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),
                            const SizedBox(height: 25),
                            ExpandableText(
                              isChecked: _isChecked,
                              onChanged: _onCheckboxChanged,
                              fullText:
                                  'I authorise TAGIC and its representatives to Call, SMS or communicate via WhatsApp regarding my application.',
                            ),
                            const SizedBox(height: 20),
                            GradientButton(
                              onPressed: _submitForm,
                              isDisabled: !_isChecked,
                              text: 'Next',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ))
        ]));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPValidation(),
        ),
      );
    }
  }

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  String? _validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    // Check if the number has 10 digits and starts with 7, 8, 9, or 6
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }
}
