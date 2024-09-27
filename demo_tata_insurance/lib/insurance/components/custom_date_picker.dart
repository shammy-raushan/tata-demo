import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'login_textbox.dart';

class CustomDatePicker extends StatefulWidget {
  final String label;
  final DateTime? initialDate;
  final FormFieldValidator<String>? validate;
  final Function(DateTime, String) onDateSelected;

  const CustomDatePicker({
    Key? key,
    required this.label,
    this.initialDate,
    required this.onDateSelected,
    this.validate,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "";
    if (widget.initialDate != null) {
      selectedDate = widget.initialDate;
      _controller.text = _formatDate(selectedDate);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = _formatDate(selectedDate);
      });
      widget.onDateSelected(picked, _formatDate(selectedDate));
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Select a date';
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LoginTextBox(
          controller: _controller,
          validator: widget.validate,
          readOnly: true,
          onTap: () => _selectDate(context),
          labelText: widget.label,
          suffixIcon: Icon(Icons.calendar_today),
        ),
      ],
    );
  }
}
