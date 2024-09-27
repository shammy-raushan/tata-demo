import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String? hintTitle;
  final String? initialValue;
  final List<String> items;
  final Function(String) onSelected;

  const CustomDropdown({
    Key? key,
    required this.label,
    this.initialValue,
    required this.onSelected,
    this.hintTitle,
    required this.items,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedGender;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialValue;
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButtonFormField<String>(
          value: selectedGender,
          hint: widget.hintTitle != null
              ? Text(
                  widget.hintTitle ?? '',
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 14,
                  ),
                )
              : null,
          isExpanded: true,
          validator: (value) {
            if (value == null) {
              return 'Please select ${widget.label}';
            }
            return null;
          },
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
          items: items.length > 0
              ? items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()
              : null,
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
            });
            if (newValue != null) {
              widget.onSelected(newValue);
            }
          },
        ),
      ],
    );
  }
}
