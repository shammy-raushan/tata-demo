import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:flutter/material.dart';

import '../utils/temp_values.dart';

class PlanDetails extends StatefulWidget {
  final int index;
  const PlanDetails({super.key, required this.index, required String searchText});

  @override
  State<PlanDetails> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  late List<String> _planDetails;
  late String _selectedPlan;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _planDetails = samplePlans[widget.index]['whatIsCovered'];
    _selectedPlan = samplePlans[widget.index]['title'];
  }

  getPlanDetails(int index) {
    if (index == 0)
      _planDetails = samplePlans[widget.index]['whatIsCovered'];
    else if (index == 1)
      _planDetails = samplePlans[widget.index]['whatIsNotIncluded'];
    else
      _planDetails = samplePlans[widget.index]['waitingPeriod'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/tata-logo.png', width: 100, height: 60),
          actions: const <Widget>[],
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(maxWidth: 350),
            margin: const EdgeInsets.fromLTRB(20, 35, 20, 30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(_selectedPlan,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 27),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      "What's Covered",
                      "What's not covered?",
                      "Waiting period"
                    ].asMap().entries.map((entry) {
                      final index = entry.key;
                      final plan = entry.value;
                      return _DetailsChip(
                        index: index,
                        title: plan, // Use 'plan' instead of 'Waiting period'
                        isSelected: _selectedIndex == index,
                        onTermAmountSelected: (selectedIndex) {
                          setState(() {
                            _selectedIndex = selectedIndex;
                            getPlanDetails(selectedIndex);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(244, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF2B62AA), width: 1.0),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          12), // Clip the children to match the border radius
                      child: Column(
                          children: _planDetails
                              .map((plan) => _TextWithPrefix(text: plan))
                              .toList())),
                ),
                const SizedBox(height: 40),
                SizedBox(
                    width: 240,
                    child: GradientButton(
                        text: 'Back',
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ],
            ),
          ),
        ));
  }
}

class _TextWithPrefix extends StatelessWidget {
  final String text;
  final String searchText = 'Dom';
  const _TextWithPrefix({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.star, size: 14, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: _highlightText(text, searchText),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _highlightText(String text, String search) {
    if (search.isEmpty) {
      return TextSpan(text: text);
    }

    final List<TextSpan> spans = [];
    final RegExp regExp = RegExp(RegExp.escape(search), caseSensitive: false);
    final Iterable<Match> matches = regExp.allMatches(text);

    int start = 0;

    for (final Match match in matches) {
      if (start < match.start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(0),
        style: TextStyle(backgroundColor: Colors.yellow),
      ));
      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return TextSpan(children: spans);
  }
}

class _DetailsChip extends StatelessWidget {
  final int index;
  final String title;
  final bool isSelected;
  final Function(int) onTermAmountSelected;
  const _DetailsChip({
    required this.isSelected,
    required this.onTermAmountSelected,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTermAmountSelected(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: isSelected
                ? Border.all(color: Color(0xFFFCD062), width: 1)
                : null,
            color: isSelected ? Color(0x4DFCD062) : Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${title}',
                  style: TextStyle(color: Colors.black, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}
