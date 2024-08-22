import 'package:demo_tata_insurance/insurance/healthOverview/sample_values.dart';
import 'package:flutter/material.dart';

import 'custon_text_button.dart';
import 'submit_button.dart';

class PreExistingDiseasesBottomSheet extends StatefulWidget {
  final ValueChanged<List<int>> onSelectionChanged;
  final List<int> selectedDisease;

  PreExistingDiseasesBottomSheet(
      {required this.onSelectionChanged, required this.selectedDisease});
  @override
  _PreExistingDiseasesBottomSheetState createState() =>
      _PreExistingDiseasesBottomSheetState();
}

class _PreExistingDiseasesBottomSheetState
    extends State<PreExistingDiseasesBottomSheet> {
  List<int> _selectedIndices = [];

  @override
  void initState() {
    super.initState();
    _selectedIndices = widget.selectedDisease;
  }

  String _selectedOption = 'No';

  void _handleSelectionChanged(List<int> selectedItems) {
    // Handle the selection change here
  }

  void _handlePress(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Text(
              'Select pre-existing diseases',
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            IconButton(
              icon: Icon(Icons.close, size: 16, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
          SizedBox(height: 10),
          Text(
            'Please select the options that are applicable',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 23.0,
            runSpacing: 14.0,
            children: List.generate(disease.length, (index) {
              final isSelected = _selectedIndices.contains(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedIndices.remove(index);
                    } else {
                      _selectedIndices.add(index);
                    }
                    _handleSelectionChanged(
                      _selectedIndices,
                    );
                  });
                },
                child: Container(
                  width: 95.0,
                  height: 95.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: isSelected
                          ? Colors.blue.shade900
                          : Colors.transparent,
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.ac_unit,
                                color: Colors.black38, size: 30),
                            SizedBox(height: 4),
                            Text(
                              disease[index]['disease'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Icon(
                            Icons.check_circle,
                            size: 20,
                            color: Colors.blue.shade900,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
          if (_selectedIndices.contains(0))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'is this member on insulin?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CustomTextButton(
                      option: 'Yes',
                      selectedOption: _selectedOption,
                      onPressed: () => _handlePress('Yes'),
                      text: 'Yes',
                    ),
                    SizedBox(width: 12.0),
                    CustomTextButton(
                      option: 'No',
                      selectedOption: _selectedOption,
                      onPressed: () => _handlePress('No'),
                      text: 'No',
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(height: 30),
          GradientButton(
            onPressed: () {
              Navigator.pop(context, _selectedIndices);
            },
            text: 'Apply',
          ),
        ],
      ),
    );
  }
}

class MedicalHistorySheet extends StatefulWidget {
  final ValueChanged<List<int>> onSelectionChanged;
  final List<int> selectedMedicalHistory;
  const MedicalHistorySheet(
      {super.key,
      required this.onSelectionChanged,
      required this.selectedMedicalHistory});

  @override
  State<MedicalHistorySheet> createState() => _MedicalHistorySheetState();
}

class _MedicalHistorySheetState extends State<MedicalHistorySheet> {
  List<int> _selectedIndices = [];

  @override
  void initState() {
    super.initState();
    _selectedIndices = widget.selectedMedicalHistory;
  }

  void _handleSelectionChanged(List<int> selectedItems) {
    // Handle the selection change here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: Text(
                'Select medical history',
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              IconButton(
                icon: Icon(Icons.close, size: 16, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ]),
            SizedBox(height: 10),
            Text(
              'Please select the options that are applicable',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: medicalHistory.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedIndices.contains(index);

                return Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 0, // Spread radius
                        blurRadius: 8, // Blur radius
                        offset: Offset(0, 4), // Shadow offset
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    title: Text(medicalHistory[index],
                        style: TextStyle(fontSize: 16)),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: Colors.blue)
                        : null,
                    tileColor: isSelected ? Colors.grey[200] : null,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.add(index);
                        }
                        _handleSelectionChanged(_selectedIndices);
                      });
                    },
                  ),
                );
              },
            ),
            GradientButton(
              onPressed: () {
                Navigator.pop(context, _selectedIndices);
              },
              text: 'Apply',
            ),
          ],
        ));
  }
}

class SubstanceSheet extends StatefulWidget {
  final dynamic onSelectionChanged;
  final Map<String, String?> selectedOptions;
  const SubstanceSheet(
      {super.key,
      required this.onSelectionChanged,
      required this.selectedOptions});

  @override
  State<SubstanceSheet> createState() => _SubstanceSheetState();
}

class _SubstanceSheetState extends State<SubstanceSheet> {
  Map<String, String?> _selectedOptions = {};

  @override
  void initState() {
    super.initState();
    _selectedOptions = widget.selectedOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: Text(
                'Select medical history',
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              IconButton(
                icon: Icon(Icons.close, size: 16, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ]),
            SizedBox(height: 10),
            Text(
              'Please select the options that are applicable',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: substance.length,
              itemBuilder: (context, index) {
                final category = substance[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category['title'],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      category['subtitle'],
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16.0),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 24.0,
                      children: (category['options'] as List<dynamic>)
                          .map<Widget>((option) {
                        final isSelected =
                            _selectedOptions[category['title']] == option;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedOptions[category['title']] =
                                  isSelected ? null : option;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: isSelected ? Colors.blue : Colors.grey,
                                width: 0.5,
                              ),
                              color: isSelected
                                  ? Colors.blue.withOpacity(0.1)
                                  : Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(option,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.black,
                                      fontSize: 14.0,
                                    )),
                                SizedBox(width: 8.0),
                                if (isSelected)
                                  Icon(Icons.check,
                                      color: Colors.blue, size: 20.0),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    if (index != substance.length - 1) SizedBox(height: 20.0),
                    if (index != substance.length - 1) Divider(),
                    if (index != substance.length - 1) SizedBox(height: 20.0),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            GradientButton(
              onPressed: () {
                Navigator.pop(context, _selectedOptions);
              },
              text: 'Apply',
            ),
          ],
        ));
  }
}
