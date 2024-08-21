import 'package:demo_tata_insurance/insurance/otp.dart';
import 'package:demo_tata_insurance/insurance/profile_details.dart';
import 'package:flutter/material.dart';

bool isChecked = false;

class TataLogin extends StatefulWidget {
  const TataLogin({super.key});

  @override
  State<TataLogin> createState() => _TataLoginState();
}

class _TataLoginState extends State<TataLogin> {
  bool? check1 = false;
  bool? check2 = false;
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
              image: AssetImage("assets/bank.png"),
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
                      TextFormField(
                        autofocus: false,
                        // initialValue: "2,50,000cccc",
                        decoration: const InputDecoration(
                          labelText: "Enter your mobile number",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autofocus: false,
                        // initialValue: "2,50,000cccc",
                        decoration: const InputDecoration(
                          labelText: "Enter your PAN",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                        ),
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
                            "click here",
                            style: TextStyle(color: Colors.blue),
                          )),
                      Row(
                        children: [
                          Checkbox(
                            value: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "we will check your cibil by principle",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
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
                                      builder: (context) => OTPValidation(),
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
      ]
          //  Padding(
          //   padding: const EdgeInsets.all(20),
          //   child:

          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const SizedBox(height: 20),

          //       const Text(
          //         "imageee",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //       const SizedBox(height: 20),
          //       PhysicalModel(
          //         color: Colors.white,
          //         elevation: 8,
          //         // shadowColor: Colors.blue,
          //         borderRadius: BorderRadius.circular(20),
          //         child: Padding(
          //           padding: const EdgeInsets.all(20.0),
          //           child: Container(
          //             width: double.infinity,
          //             // height: 100,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.stretch,
          //               children: [
          //                 const Text(
          //                   "Let's Get Started!",
          //                   style: TextStyle(
          //                     fontSize: 24,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 20),
          //                 const Text(
          //                   "Get your health insured in 5 min",
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.w400,
          //                       color: Colors.grey),
          //                 ),
          //                 const SizedBox(height: 20),
          //                 TextFormField(
          //                   autofocus: false,
          //                   // initialValue: "2,50,000cccc",
          //                   decoration: const InputDecoration(
          //                     labelText: "Enter your mobile number",
          //                     labelStyle: TextStyle(color: Colors.grey),
          //                     border: OutlineInputBorder(),
          //                     filled: true, //<-- SEE HERE
          //                     fillColor: Colors.white,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 20),
          //                 TextFormField(
          //                   autofocus: false,
          //                   // initialValue: "2,50,000cccc",
          //                   decoration: const InputDecoration(
          //                     labelText: "Enter your PAN",
          //                     labelStyle: TextStyle(color: Colors.grey),
          //                     border: OutlineInputBorder(),
          //                     filled: true, //<-- SEE HERE
          //                     fillColor: Colors.white,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 20),
          //                 TextButton(
          //                     onPressed: () {
          //                       Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                             builder: (context) => ProfileDetails(),
          //                           ));
          //                     },
          //                     child: const Text(
          //                       "click here",
          //                       style: TextStyle(color: Colors.blue),
          //                     )),
          //                 Row(
          //                   children: [
          //                     Checkbox(
          //                       value: _value,
          //                       onChanged: (value) {
          //                         setState(() {
          //                           _value = value!;
          //                         });
          //                       },
          //                     ),
          //                     const SizedBox(width: 10),
          //                     const Text(
          //                       "by giving consent we will check your cibil by principle",
          //                       style: TextStyle(
          //                         fontSize: 12,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(height: 20),
          //                 Container(
          //                   width: double.infinity,
          //                   child: ElevatedButton(
          //                     onPressed: _value == true
          //                         // check1 == false || check2 == false
          //                         //     ? null
          //                         //     :
          //                         ? () {
          //                             // Navigator.push(
          //                             //   context,
          //                             //   MaterialPageRoute(
          //                             //     builder: (context) => ProfileDetails(),
          //                             //   ),
          //                             // );
          //                           }
          //                         : null,
          //                     child: const Text("Next"),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          ),
    );
  }
}
