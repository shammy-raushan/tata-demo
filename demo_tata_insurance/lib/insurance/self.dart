import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/term_selection.dart';
import 'package:flutter/material.dart';

import 'components/custom_dropdown.dart';
import 'components/custom_stepper.dart';
import 'components/floating_action_btn.dart';

class SelfSelection extends StatefulWidget {
  const SelfSelection({super.key});

  @override
  State<SelfSelection> createState() => _SelfSelectionState();
}

class _SelfSelectionState extends State<SelfSelection> {
  final _formKey = GlobalKey<FormState>();
  Set<String> selectedCards = {};
  String? relationship;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset('assets/tata-logo.png', width: 100, height: 60),
          actions: const <Widget>[],
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
              child: Opacity(
            opacity: 0.04,
            child: Image.asset('assets/pattern.png', fit: BoxFit.cover),
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
                    color: Color.fromARGB(244, 255, 255, 255),
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
                                          cardSel:
                                              selectedCards.contains("Self"),
                                          onCardSelected: onCardSelected,
                                          title: "Self",
                                          imgUrl: "assets/female.png"),
                                      const SizedBox(height: 24),
                                      CustomSelector(
                                          cardSel:
                                              selectedCards.contains("Family"),
                                          onCardSelected: onFamilyCardSlected,
                                          title: "Family",
                                          relationship: relationship,
                                          imgUrl: "assets/family.png"),
                                      const SizedBox(height: 40),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: GradientButton(
                                              text: "Proceed",
                                              isDisabled: selectedCards.isEmpty,
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
        floatingActionButton: FloatingActionBtn());
  }

  void _onRelationSelected(String value) {
    setState(() {
      relationship = value;
    });
  }

  void onCardSelected(String title) {
    setState(() {
      if (selectedCards.contains(title)) {
        selectedCards.remove(title);
      } else {
        selectedCards.add(title);
      }
    });
  }

  Future<void> onFamilyCardSlected(String title) async {
    await showModalBottomSheet<dynamic>(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(23.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        'Add Family',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      IconButton(
                        icon: Icon(Icons.close, size: 16, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
                SizedBox(height: 55),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add members you want to cover',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      Container(
                        constraints: BoxConstraints(maxWidth: 300),
                        child: CustomDropdown(
                          label: 'Relationship',
                          onSelected: _onRelationSelected,
                          initialValue: relationship,
                          items: [
                            'Father',
                            'Mother',
                            'Spouse',
                            'Son',
                            'Daughter',
                            'Brother',
                            'Sister',
                            'Other',
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+ Member',
                        overflow: TextOverflow.clip,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF2B62AA)),
                      ),
                      SizedBox(height: 55),
                    ],
                  ),
                ),
                SizedBox(
                    width: 250,
                    child: GradientButton(
                        text: "Apply",
                        isDisabled:
                            !(relationship == null || relationship!.isNotEmpty),
                        onPressed: () => {
                              onCardSelected(title),
                              Navigator.pop(context),
                            })),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomSelector extends StatelessWidget {
  final bool cardSel;
  final Function(String) onCardSelected;
  final String title;
  final String imgUrl;
  final String? relationship;
  const CustomSelector(
      {super.key,
      required this.cardSel,
      required this.onCardSelected,
      required this.title,
      required this.imgUrl,
      this.relationship});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardSelected(title);
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: (relationship != null) ? 130 : 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
            border: cardSel
                ? Border.all(
                    color: cardSel ? Color(0xFF254A9E) : Colors.white, width: 2)
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 16),
                      Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(top: 10),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  if (relationship != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 14),
                      child: Row(
                        children: [
                          _CustomChip(text: relationship!),
                          SizedBox(width: 15),
                          Icon(Icons.edit,
                              size: 16, color: Colors.blue.shade900),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (cardSel)
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

class _CustomChip extends StatelessWidget {
  final String text;
  const _CustomChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue.withOpacity(0.1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text.replaceAll('\n', ''),
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
              )),
        ],
      ),
    );
  }
}
