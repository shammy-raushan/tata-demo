import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/new_login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7EEFB),
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
          ),
        ),
        Positioned.fill(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          SizedBox(height: 238),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: PhysicalModel(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(23, 40, 26, 20),
                      child: Container(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Get your health insured in ',
                                      ),
                                      TextSpan(
                                        text: '5 min!',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF2B62AA)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircularIconWithText(
                                        icon: Icons.calendar_month,
                                        text: Column(
                                          children: [
                                            SizedBox(height: 5),
                                            Text(
                                              '2 step quote',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CircularIconWithText(
                                        icon: Icons.text_snippet,
                                        text: const Text(
                                          'ABHA\nIntegrated',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      CircularIconWithText(
                                        icon: Icons.currency_rupee,
                                        text: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors
                                                  .black, // Default text color
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Low',
                                                style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w700, // Bold font weight for "Low"
                                                ),
                                              ),
                                              TextSpan(
                                                text: '\nInterest Rates',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      CircularIconWithText(
                                        icon: Icons.local_police,
                                        text: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors
                                                  .black, // Default text color
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '100%',
                                                style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w700, // Bold font weight for "Low"
                                                ),
                                              ),
                                              TextSpan(
                                                text: '\nSecure & Easy',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: 60),
                                GradientButton(
                                  text: "Apply Now",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewTataLogin(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 15),
                              ])))))
        ])))
      ]),
    );
  }
}

class CircularIconWithText extends StatelessWidget {
  final IconData? icon;
  final Widget text;
  const CircularIconWithText(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44.0,
          height: 44.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2B62AA).withOpacity(0.16),
          ),
          child: Icon(
            icon,
            color: Color(0xFF2B62AA),
            size: 24.0,
          ),
          alignment: Alignment.center,
        ),
        SizedBox(height: 24.0),
        Container(
          constraints: BoxConstraints(
            maxWidth: 100.0,
          ),
          child: text,
        ),
      ],
    );
  }
}
