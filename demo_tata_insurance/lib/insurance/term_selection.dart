// import 'package:demo_tata_insurance/insurance/selection.dart';
import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart' as intl;
import 'package:demo_tata_insurance/global.dart' as globals;

import 'components/custom_stepper.dart';

enum ProductType { Gold, Silver, Dimond, Blank }

class TermSelection extends StatefulWidget {
  const TermSelection({super.key});

  @override
  State<TermSelection> createState() => _TermSelectionState();
}

class _TermSelectionState extends State<TermSelection> {
  final myController = TextEditingController();

  int months_option = globals.months_option;

  double rate = 7.20;

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

  static List<Map<String, dynamic>> termAmount = [
    {"label": "10 L", "value": 1000000},
    {"label": "25 L", "value": 2500000},
    {"label": "50 L", "value": 5000000},
    {"label": "1 Cr", "value": 10000000},
  ];

  static List<Map<String, dynamic>> termTenure = [
    {"label": "1 yr", "value": 1},
    {"label": "2 yrs", "value": 2},
    {"label": "3 yrs", "value": 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/tata-logo.png',
          width: 100,
          height: 60,
        ),
        automaticallyImplyLeading: false,
        actions: const <Widget>[
          Icon(Icons.pin_drop),
          Text("New Delhi",
              style: TextStyle(fontSize: 16, color: Colors.black)),
          SizedBox(width: 15),
        ],
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
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSteppper(currentStep: 2),
                SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "Cover Amount",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.info_outline)),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  'How much health coverage do you need?',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 24.0,
                  children: termAmount.asMap().entries.map((entry) {
                    var option = entry.value;
                    return TermChip(
                      option: option,
                      isSelected: selectAmount == option['value'],
                      onTermAmountSelected: onTermAmountSelected,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 18),
                Text(
                  'Select tenure',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 24.0,
                  children: termTenure.asMap().entries.map((entry) {
                    var option = entry.value;
                    return TermChip(
                      option: option,
                      isSelected: tenure == option['value'],
                      onTermAmountSelected: onTermTenureSelected,
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Or",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF222222)),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autofocus: false,
                  controller: TextEditingController(
                      text:
                          'INR ${formats.format((selectAmount > 0) ? selectAmount : 1000000)}'),
                  decoration: InputDecoration(
                    labelText: "Amount",
                    labelStyle: TextStyle(color: Color(0xFF666666)),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  ),
                ),
                const SizedBox(height: 20),
                GradientButton(
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => planspage(),
                        ),
                      );
                    }),
                const SizedBox(height: 20),
                Center(
                  child: PhysicalModel(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: double.infinity,
                        // height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Unsure?",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: const Text(
                                    "complete this short questionnaire to find the ideal insurance plan for you",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF0B2110)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 60.0),
                                    child: SvgPicture.asset(
                                      'assets/KycForm.svg',
                                      width: 60,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => planspage(),
                                  ),
                                );
                              },
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    'Show me my ideal insurance plan',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
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
                ),
                Container(
                  height: 64,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFE7EEFB),
                    border: Border.all(
                      color: Color(0xFF254A9E), // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Mask-group.png',
                        height: 63,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Unsure about the cover \namount to choose?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF787878),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.play_circle,
                        color: Color(0xFF5F6368),
                        size: 14,
                      )
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

  void onTermAmountSelected(int amount) {
    setState(() {
      selectAmount = amount;
    });
  }

  void onTermTenureSelected(int amount) {
    setState(() {
      tenure = amount;
    });
  }
}

class TermChip extends StatelessWidget {
  final Map<String, dynamic> option;
  final bool isSelected;
  final Function(int) onTermAmountSelected;
  const TermChip(
      {super.key,
      required this.option,
      required this.isSelected,
      required this.onTermAmountSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // if (option == "10 L") {
          //   globals.deposit_amount = 1000000;
          // } else if (option == "25 L") {
          //   globals.deposit_amount = 2500000;
          // } else if (option == "50 L") {
          //   globals.deposit_amount = 5000000;
          // } else if (option == "1 Cr") {
          //   globals.deposit_amount = 10000000;
          // }
          onTermAmountSelected(option['value']);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border:
                Border.all(color: Color(0xFF254A9E), width: isSelected ? 1 : 0),
            color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  ((option['value'] ==1 ) || (option['value'] == 2)||
                          (option['value'] == 3)) ?'${option['label']}':'₹ ${option['label']}',
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ));
  }
}


