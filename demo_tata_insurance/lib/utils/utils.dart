import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'prefs_service.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

String formatCurrency(dynamic value, {String symbol = 'INR '}) {
  final number = num.tryParse(value.toString());
  if (number == null) {
    return 'Invalid number';
  }

  return NumberFormat.currency(
          locale: 'en_IN',
          decimalDigits: 0, // Change to get decimal places if needed
          symbol: symbol //'₹ ', // Uncomment if you want the currency symbol
          )
      .format(number);
}

Future<String> loadStoredValue(String key) async {
  final PrefsService _prefsService = PrefsService();
  try {
    var value = await _prefsService.getString(key);
    return value ?? "";
  } catch (e) {
    print(e);
  }
  return "";
}

Future<void> storeValue(String key, String value) async {
  final PrefsService _prefsService = PrefsService();
  try {
    await _prefsService.setString(key, value);
  } catch (e) {
    print(e);
  }
}
