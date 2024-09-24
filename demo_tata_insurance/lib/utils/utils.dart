import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

String formatCurrency(dynamic value) {
  final number = num.tryParse(value.toString());
  if (number == null) {
    return 'Invalid number';
  }

  return NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 0, // Change to get decimal places if needed
    symbol: '₹ ', // Uncomment if you want the currency symbol
  ).format(number);
}
