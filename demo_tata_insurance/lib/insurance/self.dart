import 'package:demo_tata_insurance/insurance/selection.dart';
import 'package:demo_tata_insurance/insurance/term_selection.dart';
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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const StepProgressIndicator(
                totalSteps: 4,
                currentStep: 1,
                selectedColor: Colors.blue,
              ),
              const SizedBox(height: 40),
              const Text(
                "Who all do you want to insure",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey),
              ),
              const SizedBox(height: 40),
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
                    child:const Padding(
                      padding:  EdgeInsets.fromLTRB(20, 20, 20, 60),
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 40.0),
                            child: Icon(Icons.person_3_outlined),
                          ),
                           Text(
                            "Self",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
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
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 60),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 40.0),
                            child: Icon(Icons.person_2_outlined),
                          ),
                          Text(
                            "Family",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () { 
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermSelection(),
                                ));}, child: Text("Proceed")))
            ],
          ),
        ),
      ]),
    );
  }
}
