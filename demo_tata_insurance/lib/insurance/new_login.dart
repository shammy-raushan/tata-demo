import 'package:demo_tata_insurance/insurance/components/login_textbox.dart';
import 'package:demo_tata_insurance/insurance/otp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/submit_button.dart';
import 'profile_details.dart';

bool isChecked = false;

class NewTataLogin extends StatefulWidget {
  const NewTataLogin({super.key});

  @override
  State<NewTataLogin> createState() => _NewTataLoginState();
}

class _NewTataLoginState extends State<NewTataLogin> {
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
            right: 24,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ProfileDetails(),
                //   ),
                // );
              },
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 1.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.blue,
                  size: 16.0,
                ),
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: SvgPicture.asset('assets/signIn.svg')),
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
                      width: double.infinity,
                      height: 480,
                      constraints: BoxConstraints(
                        maxWidth: 350, // Set the maximum width here
                      ),
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
                          LoginTextBox(labelText: 'Enter Mobile Number'),
                          const SizedBox(height: 24),
                          LoginTextBox(labelText: 'Enter your PAN'),
                          const SizedBox(height: 28),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xFFE7EEFB),
                              border: Border.all(
                                color: Color(0xFF254A9E),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/profile.png',
                                ),
                                SizedBox(width: 19),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF787878),
                                        letterSpacing: 0.5),
                                    children: [
                                      TextSpan(
                                        text:
                                            "Don't have PAN handy? No problem,\njust click ",
                                      ),
                                      TextSpan(
                                        text: "here",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileDetails(),
                                              ),
                                            );
                                          },
                                      ),
                                      TextSpan(
                                        text: " to get a quick quote!",
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: const Text(
                                  "by giving consent we will check your cibil by principle",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          GradientButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPValidation(),
                                ),
                              );
                            },
                            isDisabled: !_value,
                            text: 'Next',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ))
        ]));
  }
}
