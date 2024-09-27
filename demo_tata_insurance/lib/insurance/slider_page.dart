import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_tata_insurance/insurance/plan-tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/temp_values.dart';
import '../utils/utils.dart';
import 'components/custom_stepper.dart';
import 'components/floating_action_btn.dart';

class planspage extends StatefulWidget {
  final bool goback;
  const planspage({super.key, this.goback = false});

  @override
  State<planspage> createState() => _planspageState();
}

class _planspageState extends State<planspage> {
  int _sliding = 0;
  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    try {
      var termPaidBy = await loadStoredValue('termPaidBy');
      if (termPaidBy.isNotEmpty)
        _sliding = int.parse(termPaidBy);
      else
        await storeValue('termPaidBy', '0');
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/tata-logo.png', width: 100, height: 60),
        actions: const <Widget>[],
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.04,
            child: Image.asset('assets/pattern.png', fit: BoxFit.cover),
          )),
          Positioned.fill(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 350),
                  margin: const EdgeInsets.fromLTRB(20, 35, 20, 30),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      const CustomStepper(currentStep: 2),
                      const SizedBox(height: 20),
                      const Text(
                        "Our recommended plan for you",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 24),

                      //Sliding Segment Button
                      CupertinoSlidingSegmentedControl(
                        onValueChanged: (int? newvalue) async {
                          await storeValue('termPaidBy', newvalue.toString());
                          setState(() {
                            _sliding = newvalue ?? 0;
                          });
                        },
                        children: const {
                          0: Text('Yearly'),
                          1: Text('Monthly'),
                        },
                        groupValue: _sliding,
                      ),

                      const SizedBox(height: 24),
                      _TermsSlider(
                          currentStep: _sliding, goback: widget.goback),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: Color(0xFF254A9E), width: 1),
                              color: Color(0xFFE7EEFB)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 9.0),
                          child: Row(
                            children: [
                              Image.asset("discount.png"),
                              SizedBox(width: 15),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Looking to reduce your premium further?\n",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          height: 1.5,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Check your CIBIL score ",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue,
                                          height: 1.5,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "to get an extra discount on your premium.",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cashless hospital facilities near you",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                "AIMS - 500m",
                                "Fortis - 1.2km",
                                "Apollo - 1.7km"
                              ].map<Widget>((feature) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blue.withOpacity(0.10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        size: 12,
                                        color: const Color.fromARGB(
                                            255, 9, 56, 127),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        feature,
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            TermSearchTextField(
                              onTap: () {},
                              labelText: "Search hospitals",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionBtn(),
    );
  }
}

class _TermsSlider extends StatefulWidget {
  final int currentStep;
  final bool goback;
  const _TermsSlider({required this.currentStep, required this.goback});

  @override
  State<_TermsSlider> createState() => __TermsSliderState();
}

class __TermsSliderState extends State<_TermsSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 565,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CarouselSlider.builder(
          itemCount: samplePlans.length,
          itemBuilder: (context, index, realIndex) {
            return PlanTile(
              index: index,
              currentStep: widget.currentStep,
              planData: samplePlans[index],
              goback: widget.goback,
            );
          },
          carouselController: _controller,
          options: CarouselOptions(
              height: 535,
              enlargeCenterPage: true,
              initialPage: 1,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: samplePlans.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key ? Colors.blue : Colors.grey,
                  ),
                ));
          }).toList(),
        ),
      ]),
    );
  }
}
