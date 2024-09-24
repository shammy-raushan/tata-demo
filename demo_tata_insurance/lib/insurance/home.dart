import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/login.dart';
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
            height: 350,
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
                          constraints: BoxConstraints(
                            maxWidth: 350, // Set the maximum width here
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(height: 34),
                                Text(
                                  'TATA AIG - Your Preferred Partner',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 4),
                                CircularImageWithText(
                                    image: "icons/description.png",
                                    boldText: '5 cr + ',
                                    normalText:
                                        'customers serviced since inception'),
                                CircularImageWithText(
                                    image: "icons/rupee.png",
                                    boldText: '96.70% ',
                                    normalText: 'claims paid'),
                                CircularImageWithText(
                                    image: "icons/police.png",
                                    boldText: '11000 + ',
                                    normalText: 'cashless hospitals'),
                                SizedBox(height: 50),
                                GradientButton(
                                  text: "Apply Now",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TataLogin(),
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

class CircularImage extends StatelessWidget {
  final String image;
  const CircularImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF2B62AA).withOpacity(0.16),
      ),
      child: Image.asset(image),
      alignment: Alignment.center,
    );
  }
}

class CircularImageWithText extends StatelessWidget {
  final String image;
  final String boldText;
  final String normalText;
  const CircularImageWithText(
      {super.key,
      required this.image,
      required this.boldText,
      required this.normalText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          CircularImage(image: image),
          SizedBox(width: 15),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: boldText,
                    style: TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(
                  text: normalText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
