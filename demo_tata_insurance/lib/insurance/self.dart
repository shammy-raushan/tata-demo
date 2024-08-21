import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SelfSelection extends StatefulWidget {
  const SelfSelection({super.key});

  @override
  State<SelfSelection> createState() => _SelfSelectionState();
}

String cardSel = 'agent';

class _SelfSelectionState extends State<SelfSelection> {
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
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const StepProgressIndicator(
                totalSteps: 4,
                currentStep: 1,
                selectedColor: Color(0xFF13a8e1),
              ),
              const Text(
                "Who all do you want to insure",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    cardSel = 'customer';
                  });
                },
                child: Container(
                  width: double.infinity,
                  child: Card(
                    shape: cardSel == 'customer'
                        ? new RoundedRectangleBorder(
                            side: new BorderSide(
                              color: Color(0xFF13a8e1),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0))
                        : new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Text("IMG"),
                          // Image.asset(
                          //   'assets/customer.png',
                          //   height: 130,
                          //   width: 130,
                          // ),
                          const SizedBox(height: 10),
                          const Text(
                            "Self",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    cardSel = 'agent';
                  });
                },
                child: Container(
                  width: double.infinity,
                  child: Card(
                    shape: cardSel == 'agent'
                        ? new RoundedRectangleBorder(
                            side: new BorderSide(
                                color: Color(0xFF13a8e1), width: 2.0),
                            borderRadius: BorderRadius.circular(4.0))
                        : new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Text("IMG"),
                          //  SizedBox(height: 10),
                          Text(
                            "Family",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Proceed")))
            ],
          ),
        ),
      ]),
    );
  }
}
