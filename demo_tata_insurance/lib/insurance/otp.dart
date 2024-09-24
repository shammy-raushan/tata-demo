import 'package:demo_tata_insurance/insurance/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'components/submit_button.dart';

bool isChecked = false;

class OTPValidation extends StatefulWidget {
  const OTPValidation({super.key});

  @override
  State<OTPValidation> createState() => _OTPValidationState();
}

class _OTPValidationState extends State<OTPValidation> {
  OtpFieldController otpController = OtpFieldController();
  bool isDisabled = true;

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
        automaticallyImplyLeading: false,
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
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 240, 20, 20),
            child: Center(
              child: PhysicalModel(
                color: Colors.white,
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 350,
                    ),
                    height: 308,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Enter the OTP sent to your registered mobile number ending in 7898.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF787878),
                          ),
                        ),
                        const SizedBox(height: 40),
                        OTPTextField(
                          obscureText: true,
                          controller: otpController,
                          length: 6,
                          width: MediaQuery.of(context).size.width * 0.8,
                          textFieldAlignment: MainAxisAlignment.spaceEvenly,
                          fieldWidth: 40,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 6,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                            setState(() {
                              isDisabled = false;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => ProfileDetails(),
                              //     ));
                            },
                            child: const Text(
                              "Resend OTP",
                              style: TextStyle(color: Colors.blue),
                            )),
                        SizedBox(height: 20),
                        GradientButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileDetails(),
                              ),
                              (route) => false,
                            );
                          },
                          isDisabled: isDisabled,
                          text: 'Next',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
