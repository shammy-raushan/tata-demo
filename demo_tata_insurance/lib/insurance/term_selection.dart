// import 'package:demo_tata_insurance/insurance/selection.dart';
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
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
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
            padding: EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'assets/bg.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text(
                      "Cover Amount",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 190, 20, 0),
            child: InkWell(
              splashColor: const Color(0xFF13a8e1).withAlpha(30),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // try
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectAmount = 25000;
                            });
                          },
                          child: Card(
                            shape: (selectAmount == 25000)
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
                                    formatRupee.format(25000),
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
                              selectAmount = 50000;
                            });
                          },
                          child: Card(
                            shape: (selectAmount == 50000)
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
                                    formatRupee.format(50000),
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
                              selectAmount = 75000;
                            });
                          },
                          child: Card(
                            shape: (selectAmount == 75000)
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
                                    formatRupee.format(75000),
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
                              selectAmount = 100000;
                            });
                          },
                          child: Card(
                            shape: (selectAmount == 100000)
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
                                  Text(
                                    formatRupee.format(100000),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      height: 40,
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: TextEditingController(
                        text: formats
                            .format((selectAmount > 0) ? selectAmount : 100000),
                      ),
                      decoration: const InputDecoration(
                        labelText: "Amount",
                        labelStyle: TextStyle(color: Colors.grey),

                        border: OutlineInputBorder(),
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => OTPValidation(),
                            //   ),
                            // );
                          },
                          child: Text("Next")),
                    ),
                    const SizedBox(height: 8),

                    Center(
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
                                  "Unsecure?",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "complete this que",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                const SizedBox(height: 20),
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
        ]),
      ),
    );
  }
}
