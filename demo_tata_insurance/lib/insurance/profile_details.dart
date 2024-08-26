import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/self.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/submit_button.dart';

bool isChecked = false;

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  bool? check1 = false;
  bool? check2 = false;
  bool _value = false;

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
              child: SvgPicture.asset('assets/KycForm.svg')),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 176),
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      // shadowColor: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                        child: Container(
                          width: double.infinity,
                          // height: 100,
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
                              const SizedBox(height: 24),
                              LoginTextBox(labelText: "Full Name"),
                              const SizedBox(height: 24),
                              LoginTextBox(labelText: "Enter date of birth"),
                              const SizedBox(height: 24),
                              LoginTextBox(labelText: "Gender"),
                              const SizedBox(height: 24),
                              LoginTextBox(labelText: "Enter Pincode"),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    value: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },
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
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: 'Read More',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
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
                                  ))
                                ],
                              ),
                              const SizedBox(height: 20),
                              GradientButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelfSelection(),
                                    ),
                                  );
                                },
                                isDisabled: _value == false,
                                text: 'Next',
                              ),
                            ],
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
}
