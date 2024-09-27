import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/utils.dart';
import '../utils/validations.dart';
import 'components/custom_stepper.dart';
import 'components/floating_action_btn.dart';
import 'components/login_textbox.dart';
import 'components/submit_button.dart';
import 'self.dart';

class PanProfileDetails extends StatefulWidget {
  const PanProfileDetails({super.key});

  @override
  State<PanProfileDetails> createState() => _PanProfileDetailsState();
}

class _PanProfileDetailsState extends State<PanProfileDetails> {
  final _formKey = GlobalKey<FormState>();
  String pincode = '';

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
                      child: Column(children: [
                        CustomStepper(currentStep: 1),
                        SvgPicture.asset('assets/KycForm.svg'),
                        PhysicalModel(
                            color: Color.fromARGB(244, 255, 255, 255),
                            elevation: 8,
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 16, 20, 30),
                                child: Container(
                                    constraints: BoxConstraints(maxWidth: 350),
                                    child: Form(
                                        key: _formKey,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "Profile details",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Let us get to know you better!",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF787878)),
                                              ),
                                              const SizedBox(height: 30),
                                              const Text(
                                                "Your PAN",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF787878)),
                                              ),
                                              const SizedBox(height: 12),
                                              const Text(
                                                "XXXXXXXXXX",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 30),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Full Name",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF787878)),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      const Text(
                                                        "Nisarg Garg",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 36),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "DOB",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF787878)),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      const Text(
                                                        "01/05/1988",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 30),
                                              const Text(
                                                "Gender",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF787878)),
                                              ),
                                              const SizedBox(height: 12),
                                              const Text(
                                                "Male",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 20),
                                              LoginTextBox(
                                                maxLength: 6,
                                                labelText:
                                                    "Pincode of where you live",
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                validator: validatePincode,
                                                onChanged: (value) {
                                                  pincode = value;
                                                },
                                              ),
                                              Text(
                                                  'The above pincode will be considered for quote generation',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color:
                                                          Color(0xFF787878))),
                                              const SizedBox(height: 35),
                                              GradientButton(
                                                onPressed: _submitForm,
                                                text: 'Next',
                                              ),
                                            ])))))
                      ]))))
        ]),
        floatingActionButton: FloatingActionBtn());
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      storeValue('pincode', pincode);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelfSelection(),
        ),
      );
    }
  }
}
