import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'custon_text_button.dart';
import 'pre_existing_diseases.dart';
import '../../utils/sample_values.dart';

class QuestionsCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final int index;
  const QuestionsCard({super.key, required this.data, required this.index});

  @override
  _QuestionsCardState createState() => _QuestionsCardState();
}

class _QuestionsCardState extends State<QuestionsCard> {
  String _selectedOption = 'No';
  List<int> _selectedDisease = [];
  List<int> _selectedMedicaHistory = [];
  Map<String, String?> _selectedSubstance = {};

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    try {
      _selectedOption = await loadStoredValue(widget.data['key']);
      _selectedOption = _selectedOption == "Yes" ? "Yes" : "No";
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showGridBottomSheet(BuildContext context) async {
    final selectedItems = await showModalBottomSheet<dynamic>(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        if (widget.index == 0)
          return PreExistingDiseasesBottomSheet(
            onSelectionChanged: (selected) {
              setState(() {
                _selectedDisease = selected;
              });
            },
            selectedDisease: _selectedDisease,
          );
        if (widget.index == 1)
          return MedicalHistorySheet(
            onSelectionChanged: (selected) {
              setState(() {
                _selectedMedicaHistory = selected;
              });
            },
            selectedMedicalHistory: _selectedMedicaHistory,
          );
        if (widget.index == 3)
          return SubstanceSheet(
            onSelectionChanged: (selected) {
              setState(() {
                _selectedSubstance = selected;
              });
            },
            selectedOptions: _selectedSubstance,
          );
        return SizedBox();
      },
    );
    if (selectedItems != null) {
      if (widget.index == 0) {
        setState(() {
          _selectedDisease = selectedItems;
        });
      }
      if (widget.index == 1) {
        setState(() {
          _selectedMedicaHistory = selectedItems;
        });
      }
      if (widget.index == 3) {
        setState(() {
          _selectedSubstance = selectedItems;
        });
      }
    }
  }

  void _handlePress(String option) {
    setState(() {
      storeValue(widget.data['key'], option);
      _selectedOption = option;
    });
    if (option == 'Yes' && widget.index != 2) {
      _showGridBottomSheet(context);
    }
    if (_selectedOption == 'No') {
      setState(() {
        if (widget.index == 0) _selectedDisease = [];
        if (widget.index == 1) _selectedMedicaHistory = [];
        if (widget.index == 3) _selectedSubstance = {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularCard(imageUrl: widget.data['imageUrl']),
                if (widget.index == 0 && _selectedDisease.isNotEmpty)
                  _getEditIcon(),
                if (widget.index == 1 && _selectedMedicaHistory.isNotEmpty)
                  _getEditIcon(),
                if (widget.index == 3 && _selectedSubstance.isNotEmpty)
                  _getEditIcon(),
              ],
            ),
            Text(widget.data['ques'],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            _getAnswer(),
            SizedBox(height: 20.0),
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
      ),
    );
  }

  Widget _getAnswer() {
    if (widget.index == 0) {
      if (_selectedDisease.isNotEmpty) {
        return Wrap(
          spacing: 8.0,
          children: _selectedDisease.map((index) {
            return _CustomChip(text: disease[index]['disease']);
          }).toList(),
        );
      }
    } else if (widget.index == 1) {
      if (_selectedMedicaHistory.isNotEmpty) {
        return Wrap(
          spacing: 8.0,
          children: _selectedMedicaHistory.map((index) {
            return _CustomChip(text: medicalHistory[index]);
          }).toList(),
        );
      }
    } else if (widget.index == 3) {
      if (_selectedSubstance.isNotEmpty) {
        return Wrap(
          spacing: 8.0,
          children: _selectedSubstance.entries.map((entry) {
            return _CustomChip(text: '${entry.key}');
          }).toList(),
        );
      }
    }
    return Text(widget.data['ans'], style: TextStyle(fontSize: 14));
  }

  Widget _getEditIcon() {
    return GestureDetector(
        onTap: () {
          _showGridBottomSheet(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.edit,
              size: 22,
              color: Colors.blue.shade900,
            ),
            SizedBox(width: 4),
            Text("Edit", style: TextStyle(color: Colors.blue.shade900)),
          ],
        ));
  }
}

class CircularCard extends StatelessWidget {
  final String imageUrl;

  const CircularCard({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.0,
      height: 45.0,
      margin: const EdgeInsets.only(bottom: 14.85),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2.0,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: imageUrl.isNotEmpty
          ? Image.asset(imageUrl, width: 24, height: 24)
          : Center(
              child: Icon(
                Icons.heat_pump_rounded,
                size: 25.5, // Adjust icon size as needed
                color: Colors.blue.shade900, // Icon color
              ),
            ),
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
