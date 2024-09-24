import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final String label;
  final String? initialValue;
  final Function(String) onGenderSelected;

  const GenderDropdown({
    Key? key,
    required this.label,
    this.initialValue,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButtonFormField<String>(
          value: selectedGender,
          hint: Text(
            'Select Gender',
            style: TextStyle(
              color: Color(0xFF787878),
              fontSize: 14,
            ),
          ),
          isExpanded: true,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(color: Color(0xFF787878), fontSize: 14),
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(
                color: Color(0xFFE9E9E9),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(
                color: Color(0xFFE9E9E9),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(
                color: Color(0xFFE9E9E9),
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          items: <String>['Male', 'Female', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
            });
            if (newValue != null) {
              widget.onGenderSelected(newValue);
            }
          },
        ),
      ],
    );
  }
}
