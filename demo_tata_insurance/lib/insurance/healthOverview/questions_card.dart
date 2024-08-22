import 'package:flutter/material.dart';

import 'custon_text_button.dart';
import 'pre_existing_diseases.dart';
import 'sample_values.dart';

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
  List<String> _selectedSubstance = [];

  Future<void> _showGridBottomSheet(BuildContext context) async {
    final selectedItems = await showModalBottomSheet<List<int>>(
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
          );
        return SizedBox();
      },
    );

    if (selectedItems != null) {
      setState(() {
        _selectedDisease = selectedItems;
      });
    } else {
      setState(() {
        _selectedOption = 'No';
      });
    }
  }

  void _handlePress(String option) {
    setState(() {
      _selectedOption = option;
    });
    if (option == 'Yes' && widget.index != 2) {
      _showGridBottomSheet(context);
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
            CircularCard(imageUrl: ''),
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
            return Chip(
              label: Text(disease[index]['disease']),
            );
          }).toList(),
        );
      }
    } else if (widget.index == 1) {
      if (_selectedDisease.isNotEmpty) {
        return Wrap(
          spacing: 8.0,
          children: _selectedDisease.map((index) {
            return Chip(
              label: Text(disease[index]['disease']),
            );
          }).toList(),
        );
      }
    }
    return Text(widget.data['ans'], style: TextStyle(fontSize: 14));
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
        image: imageUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl.isNotEmpty
          ? null
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
