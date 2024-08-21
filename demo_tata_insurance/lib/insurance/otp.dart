import 'package:demo_tata_insurance/insurance/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
// import 'infoPL.dart';

bool isChecked = false;

class OTPValidation extends StatefulWidget {
  const OTPValidation({super.key});

  @override
  State<OTPValidation> createState() => _OTPValidationState();
}

class _OTPValidationState extends State<OTPValidation> {
  OtpFieldController otpController = OtpFieldController();
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tata logo"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // actions: <Widget>[
        //   Icon(Icons.question_mark_rounded),
        //   SizedBox(width: 15)
        // ],
      ),
      body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),

          //
        ),
        new Center(
          child: new Text("Hello background"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 220, 20, 20),
          child: Center(
            child: PhysicalModel(
              color: Colors.white,
              elevation: 8,
              // shadowColor: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Let's Get Started!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Get your health insured in 5 min",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      OTPTextField(
                          obscureText: true,
                          controller: otpController,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceEvenly,
                          fieldWidth: 45,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 32),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          }),
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
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _value == true
                              // check1 == false || check2 == false
                              //     ? null
                              //     :
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileDetails(),
                                    ),
                                  );
                                }
                              : null,
                          child: const Text("Next"),
                        ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                      ),
                    ],
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
