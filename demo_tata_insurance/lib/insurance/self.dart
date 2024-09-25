import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/term_selection.dart';
import 'package:flutter/material.dart';

import 'components/custom_stepper.dart';

class SelfSelection extends StatefulWidget {
  const SelfSelection({super.key});

  @override
  State<SelfSelection> createState() => _SelfSelectionState();
}

class _SelfSelectionState extends State<SelfSelection> {
  final _formKey = GlobalKey<FormState>();
  String cardSel = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/tata-logo.png',
          width: 100,
          height: 60,
        ),
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
        Positioned.fill(
            child: SingleChildScrollView(
                child: Padding(
          padding: EdgeInsets.only(left: 20, top: 23, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomStepper(currentStep: 1),
              Image.asset('assets/InsuredCouple.png', fit: BoxFit.cover),
              PhysicalModel(
                  color: Colors.white.withOpacity(0.9),
                  elevation: 1,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 44, 20, 30),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 350),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      "Who all do you want to insure?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF686873)),
                                    ),
                                    const SizedBox(height: 40),
                                    CustomSelector(
                                        cardSel: cardSel,
                                        onCardSelected: onCardSelected,
                                        title: "Self",
                                        imgUrl: "assets/female.png"),
                                    const SizedBox(height: 24),
                                    CustomSelector(
                                        cardSel: cardSel,
                                        onCardSelected: onCardSelected,
                                        title: "Family",
                                        imgUrl: "assets/family.png"),
                                    const SizedBox(height: 40),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GradientButton(
                                            text: "Proceed",
                                            isDisabled: cardSel.isEmpty,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TermSelection()));
                                            })),
                                  ])))))
            ],
          ),
        ))),
      ]),
    );
  }

  void onCardSelected(String title) {
    setState(() {
      cardSel = title;
    });
  }
}

class CustomSelector extends StatelessWidget {
  final String cardSel;
  final Function(String) onCardSelected;
  final String title;
  final String imgUrl;
  const CustomSelector(
      {super.key,
      required this.cardSel,
      required this.onCardSelected,
      required this.title,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardSelected(title);
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
            border: cardSel == title
                ? Border.all(
                    color: cardSel == title ? Color(0xFF254A9E) : Colors.white,
                    width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                color: Color(0x1F163450),
                blurRadius: 89.5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 16),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      imgUrl,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            if (cardSel == title)
              Positioned(
                right: 35,
                top: 25,
                child: Icon(Icons.check,
                    size: 24, color: Color(0xFF254A9E)), // Tick mark icon
              ),
          ])),
    );
  }
}
