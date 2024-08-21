// import 'package:demo_tata_insurance/insurance/selection.dart';
import 'package:demo_tata_insurance/insurance/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:intl/intl.dart' as intl;
import 'package:demo_tata_insurance/global.dart' as globals;
import 'package:toggle_switch/toggle_switch.dart';

enum ProductType { Gold, Silver, Dimond, Blank }

class TermSelection extends StatefulWidget {
  const TermSelection({super.key});

  @override
  State<TermSelection> createState() => _TermSelectionState();
}

class _TermSelectionState extends State<TermSelection> {
  bool _value1 = false;

  final myController = TextEditingController();

  int months_option = globals.months_option;

  double rate = 7.20;

  ProductType? _productType;
  String selectType = globals.interest_type;
  int selectAmount = globals.deposit_amount;
  int finalAmount = globals.maturity_amount;
  int tenure = globals.tenure;
  var formats = intl.NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    // symbol: '₹ ',
    symbol: ' ',
  );
  var formatRupee = intl.NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹ ',
  );
  String _handleConvertInMonths(amount, months) {
    double rate = 9.5;
    double interest = (amount * (rate * 0.01)) / months;
    double total = ((amount / months) + interest).toInt();

    String ret = formats.format(total);
    finalAmount = total as int;
    return ret;
  }

  String _handleMaturityAmountCalculation(amount) {
    int total = amount + ((amount * (months_option / 12) * rate) / 100).toInt();
    String res = formatRupee.format(total);

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/tata-logo.png',
          width: 100,
          height: 60,
        ),
        actions: const <Widget>[
          Icon(Icons.question_mark_rounded),
          SizedBox(width: 15),
        ],
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
       
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            splashColor: const Color(0xFF13a8e1).withAlpha(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // try
                Row(
                  children: [
                    const Text(
                      "Cover Amount",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Icon(Icons.info_outline)),
                  ],
                ),
            
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'How Much Health Coverage Do You Need',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 8),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectAmount = 1000000;
                        });
                      },
                      child: Card(
                        shape: (selectAmount == 1000000)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 70, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee),
                                  Text(
                                    "10 L",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF13A8E1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectAmount = 2500000;
                        });
                      },
                      child: Card(
                        shape: (selectAmount == 2500000)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 70, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee),
                                  Text(
                                    "25 L",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF13A8E1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectAmount = 5000000;
                        });
                      },
                      child: Card(
                        shape: (selectAmount == 5000000)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 76, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee),
                                  Text(
                                    "75 L",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF13A8E1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectAmount = 10000000;
                        });
                      },
                      child: Card(
                        shape: (selectAmount == 10000000)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 80, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee,
                                  ),
                                  Text(
                                    "1 cr",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF13A8E1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
            
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Select tenure',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 8),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tenure = 1;
                        });
                      },
                      child: Card(
                        shape: (tenure == 1)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 70, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "1 yr",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF13A8E1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tenure = 2;
                        });
                      },
                      child: Card(
                        shape: (tenure == 2)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 70, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "2 yr",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF13A8E1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tenure = 3;
                        });
                      },
                      child: Card(
                        shape: (tenure == 3)
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF13A8E1), width: 4.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : null,
                        elevation: 4,
                        child: SizedBox(
                          // height: 80,
                          width: 76, height: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "3 yr",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF13A8E1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "Or",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: false,
                  controller: TextEditingController(
                    text: formats
                        .format((selectAmount > 0) ? selectAmount : 1000000),
                  ),
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    labelStyle: TextStyle(color: Colors.grey),
            
                    border: OutlineInputBorder(),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white,
                  ),
                ),
            
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => planspage(),
                          ),
                        );
                      },
                      child: Text("Next")),
                ),
                const SizedBox(height: 20),
            
                Center(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 8,
                    // shadowColor: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,4,20,4),
                      child: Container(
                        width: double.infinity,
                        // height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Unsecure?",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  "complete this short\nquestionnaire to find the ideal\ninsurance plan for you",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60.0),
                                  child: Icon(Icons.file_copy_outlined),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/profile.png',
                        width: 55,
                        height: 20,
                      ),
                      Text(
                        "Unsure about the cover amount to choose?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 128, 128, 128),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
