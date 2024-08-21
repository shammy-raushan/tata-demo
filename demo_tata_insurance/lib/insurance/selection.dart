import 'package:demo_tata_insurance/insurance/tata_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:sar/PL/employment_fd.dart';
// import 'package:demo_tata_insurance/insurance/global.dart' as globals;
import 'package:intl/intl.dart' as intl;
import 'package:demo_tata_insurance/global.dart' as globals;
import 'package:toggle_switch/toggle_switch.dart';

enum ProductType { Gold, Silver, Dimond, Blank }

class ProductSelection extends StatefulWidget {
  const ProductSelection({super.key});

  @override
  State<ProductSelection> createState() => _ProductSelectionState();
}

class _ProductSelectionState extends State<ProductSelection> {
  bool _value1 = false;

  final myController = TextEditingController();

  int months_option = globals.months_option;

  double rate = 7.20;

  ProductType? _productType;
  String selectType = globals.interest_type;
  int selectAmount = globals.deposit_amount;
  int finalAmount = globals.maturity_amount;

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

  // String maturityAmount = res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/bg.png',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
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
                            Text(
                              'Open FD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.search_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 190, 20, 0),
                    child: Card(
                      color: Colors.white,
                      // surfaceTintColor: Theme.of(context).colorScheme.surface,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      elevation: 1,
                      child: InkWell(
                        splashColor: const Color(0xFF13a8e1).withAlpha(30),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // try
                              DropdownButtonFormField<int>(
                                value: selectAmount,
                                items: <int>[
                                  25000,
                                  50000,
                                  75000,
                                  100000,
                                  125000,
                                  150000,
                                  175000,
                                  200000,
                                ].map((int value) {
                                  return new DropdownMenuItem<int>(
                                    value: value,
                                    child: new Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectAmount = newValue!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Deposit Amount",
                                  hintText: "Min 5000 to Max 5,00,00,000",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Color(0xFF13a8e1),
                                  ),
                                ),
                                iconSize: 0.0,
                                dropdownColor: Colors.white,
                              ),

                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Balance - 45,00,000/- (AC Number-XXXX1234)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 70, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              formatRupee.format(25000),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
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
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 70, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              formatRupee.format(50000),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
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
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 76, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              formatRupee.format(75000),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
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
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 80, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              formatRupee.format(100000),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              TextFormField(
                                autofocus: false,
                                controller: TextEditingController(
                                  text: formats.format((months_option > 0)
                                      ? months_option
                                      : 20000),
                                ),
                                decoration: const InputDecoration(
                                  labelText: "Tenure",
                                  labelStyle: TextStyle(color: Colors.grey),

                                  border: OutlineInputBorder(),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Colors.white,
                                ),
                              ),
                              Slider(
                                label: "Select Age",
                                value: months_option.toDouble(),
                                activeColor: Color(0xFF13A8E1),
                                onChanged: (value) {
                                  setState(() {
                                    months_option = value.toInt();
                                  });
                                },
                                min: 12,
                                max: 100,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      'assets/bg.png',
                                      // height: 300,
                                      // width: double.infinity,
                                      // fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(
                                    "Interest rate",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFF13A8E1),
                                      color: Color(0xFF13A8E1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const SizedBox(
                                  width: double.infinity,
                                  child: Text('Interest Credit Frequency')),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectType = 'On Maturity';
                                      });
                                    },
                                    child: Card(
                                      shape: (selectType == 'On Maturity')
                                          ? RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 94, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'On Maturity',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Chip(
                                  //     shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(20),
                                  //         side: BorderSide(
                                  //             color: Color(0xFF13A8E1))),
                                  //     backgroundColor: Colors.white,
                                  //     labelStyle:
                                  //         TextStyle(color: Color(0xFF13A8E1)),
                                  //     label: Text('On Maturity'),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectType = 'Monthly';
                                      });
                                    },
                                    child: Card(
                                      shape: (selectType == 'Monthly')
                                          ? RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 94, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Monthly',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectType = 'Quarterly';
                                      });
                                    },
                                    child: Card(
                                      shape: (selectType == 'Quarterly')
                                          ? RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Color(0xFF13A8E1),
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0))
                                          : null,
                                      elevation: 4,
                                      child: SizedBox(
                                        // height: 80,
                                        width: 94, height: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Quarterly',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF13A8E1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Color(0xFF13a8e1),
                    // onTap: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => EmailVerificationHL()));
                    // },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Interest Rate",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '7.20%',
                                    style: TextStyle(color: Color(0xFF13A8E1)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              thickness: 3.0,
                              color: Colors.grey,
                              // indent: 25.0,
                              // endIndent: 25.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                "Maturity Amount",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _handleMaturityAmountCalculation(selectAmount),
                                style: TextStyle(color: Color(0xFF13A8E1)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                child: InkWell(
                  splashColor: const Color(0xFF13a8e1).withAlpha(30),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Auto-renewal",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            ToggleSwitch(
                              minWidth: 44.0, minHeight: 20,
                              initialLabelIndex: 0,
                              borderColor: [Color(0xFF13A8E1)],
                              cornerRadius: 20.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.transparent,
                              inactiveFgColor: Colors.blue,
                              totalSwitches: 2,
                              labels: ['Yes', 'No'],
                              // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                              activeBgColors: [
                                [Color(0xFF13A8E1)],
                                [Color(0xFF13A8E1)]
                              ],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Checkbox(
                              value: _value1,
                              onChanged: (bool? _value) {
                                setState(() {
                                  _value1 = _value!;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                const Text(
                                  "I accept the ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Terms & Conditions",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFF13A8E1),
                                      color: Color(0xFF13A8E1)),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _value1 == true
                      // check1 == false || check2 == false
                      //     ? null
                      //     :
                      ? () {
                          setState(() {
                            globals.deposit_amount = selectAmount;
                            globals.months_option = months_option;
                            globals.maturity_amount = finalAmount;
                            globals.interest_type = selectType;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TataLogin(),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    "Proceed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

//     Scaffold(
//       appBar: AppBar(
//         title: const Text("Open FD"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         actions: const <Widget>[
//           Icon(Icons.question_mark_rounded),
//           SizedBox(width: 15)
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//                Container(
//                       alignment: Alignment.center,
//                       child: Image.asset(
//                         'assets/homePage.png',
//                         height: 300,
//                         width:double.infinity,
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0, left: 10),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.45,
//                   child: Card(
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 48, vertical: 14),
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               side: const BorderSide(
//                                 color: Color(0xFF13a8e1),
//                                 width: 3,
//                               ),
//                             ),
//                             elevation: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "Apply for",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       ShaderMask(
//                                         shaderCallback: (bounds) =>
//                                             const LinearGradient(
//                                           colors: [
//                                             Color(0xFF13a8e1),
//                                             Color(0xffE97A2A)
//                                           ],
//                                         ).createShader(bounds),
//                                         child: Text(
//                                           format.format(
//                                               (amount > 0) ? amount : 200000),
//                                           style: TextStyle(
//                                             fontSize: 32.0,
//                                             color: Color(0xFF13a8e1),
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [Text("Loan Offer"), Text("7/11")],
//               ),
//               const SizedBox(height: 10),
//               const StepProgressIndicator(
//                 totalSteps: 11,
//                 currentStep: 7,
//                 selectedColor: Color(0xFF13a8e1),
//               ),
//               const SizedBox(height: 20),
//               Column(
//                 children: [
//                   const Text(
//                     "Congratulations!",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//                   ),
//                   const Text(
//                     "You have been approved for a",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         "loan of up to",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w200),
//                       ),
//                       Text(
//                         "₹2,00,000",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff45C00B),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Use the slider below to choose the loan amount",
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//                   ),
//                   const Text(
//                     "you want to apply for",
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//                   ),
//                   Slider(
//                     label: "Select Age",
//                     value: amount.toDouble(),
//                     activeColor: Color(0xFFF06522),
//                     onChanged: (value) {
//                       setState(() {
//                         amount = value.toInt();
//                       });
//                     },
//                     min: 5000,
//                     max: 200000,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                   side: const BorderSide(
//                     color: Color(0xFF13a8e1),
//                     width: 3,
//                   ),
//                 ),
//                 elevation: 5,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Apply for",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           ShaderMask(
//                             shaderCallback: (bounds) => const LinearGradient(
//                               colors: [Color(0xFF13a8e1), Color(0xffE97A2A)],
//                             ).createShader(bounds),
//                             child: Text(
//                               format.format((amount > 0) ? amount : 200000),
//                               style: TextStyle(
//                                 fontSize: 32.0,
//                                 color: Color(0xFF13a8e1),
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 elevation: 5,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Pick a recommended EMI plan',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const Text(
//                         'Interest @ 20.88% PA',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xffBABABA)),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RadioListTile<ProductType>(
//                               contentPadding: const EdgeInsets.all(0.0),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0)),
//                               value: ProductType.Gold,
//                               groupValue: _productType,
//                               title: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     _handleCalculation(amount, 48),
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   Text(
//                                     'x 48 months',
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   Chip(
//                                     backgroundColor: Color(0xFF13a8e1),
//                                     labelStyle: TextStyle(color: Colors.white),
//                                     label: Text('Recommended'),
//                                   )
//                                 ],
//                               ),
//                               dense: true,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _productType = value;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RadioListTile<ProductType>(
//                               contentPadding: const EdgeInsets.all(0.0),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0)),
//                               value: ProductType.Silver,
//                               groupValue: _productType,
//                               title: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     _handleCalculation(amount, 36),
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   Text(
//                                     'x 36 months',
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   SizedBox(
//                                     width: 115,
//                                   )
//                                 ],
//                               ),
//                               dense: true,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _productType = value;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RadioListTile<ProductType>(
//                               contentPadding: const EdgeInsets.all(0.0),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0)),
//                               value: ProductType.Dimond,
//                               groupValue: _productType,
//                               title: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     _handleCalculation(amount, 18),
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   Text(
//                                     'x 18 months',
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   SizedBox(
//                                     width: 120,
//                                   )
//                                 ],
//                               ),
//                               dense: true,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _productType = value;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: (_productType == null)
//                         ? null
//                         : () {
//                             setState(() {
//                               globals.amount = amount;
//                             });
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LoanSummary(),
//                               ),
//                             );
//                           },
//                     child: const Text("Review loan details"),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
