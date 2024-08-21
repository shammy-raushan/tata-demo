import 'package:demo_tata_insurance/insurance/self.dart';
import 'package:flutter/material.dart';

bool isChecked = false;

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  bool? check1 = false;
  bool? check2 = false;
  bool _value = false;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              PhysicalModel(
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
                          "Profile details",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Let us get to know you better!",
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
                            labelText: "Full name",
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
                            labelText: "Enter date of birth",
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
                            labelText: "Gender",
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
                            labelText: "Enter Pincode",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
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
                              "I authorize the Bank and its represemtatives\n to Call, SMS or communicate via WhatsApp\n regarding my application.\n Read More",
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
                                        builder: (context) => SelfSelection(),
                                      ),
                                    );
                                  }
                                : null,
                            child: const Text("Next"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
