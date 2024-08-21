
import 'package:demo_tata_insurance/insurance/otp.dart';
import 'package:flutter/material.dart';

bool isChecked = false;

class NewTataLogin extends StatefulWidget {
  const NewTataLogin({super.key});

  @override
  State<NewTataLogin> createState() => _NewTataLoginState();
}

class _NewTataLoginState extends State<NewTataLogin> {
  bool? check1 = false;
  bool? check2 = false;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
       
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 170, 20, 20),
          child: Center(
            child: PhysicalModel(
              color: Colors.grey.shade100,
              elevation: 8,
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
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromARGB(255, 247, 246, 246),
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
                          fillColor: Color.fromARGB(255, 247, 246, 246),
                        ),
                      ),
                      const SizedBox(height: 20),
                  

                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 20, right: 20),
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
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Don't have PAN handy? No problem,\n just click here to get a quick quote!",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 128, 128, 128),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

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
                          const SizedBox(width: 1),
                          const Text(
                            "We will check your cibil by principle",
                            style: TextStyle(
                              fontSize: 13,
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
                       
                      ),
                     ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]
        
        
          
          
         
          
         
          
         
         

          ),
    );
  }
}
