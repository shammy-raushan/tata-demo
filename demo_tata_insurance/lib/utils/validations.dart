String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your mobile number';
  }
  // Check if the number has 10 digits and starts with 7, 8, 9, or 6
  if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
    return 'Please enter a valid mobile number';
  }
  return null;
}

String? validateString(String? value, String? message) {
  if (value == null || value.isEmpty) {
    return message ?? 'This field is required';
  }
  return null;
}

String? validatePincode(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your PIN code';
  }
  // Check if the PIN code is exactly 6 digits
  if (!RegExp(r'^\d{6}$').hasMatch(value)) {
    return 'Please enter a valid 6-digit PIN code';
  }
  return null;
}

String? validatePAN(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your PAN Number';
  }

  if (value.length != 10) {
    return 'Enter a valid PAN.';
  }

  if (!RegExp(r'^[A-Z]{5}').hasMatch(value.substring(0, 5))) {
    return 'Enter a valid PAN.';
  }

  if (value[3] != 'P') {
    return 'PAN - 4th letter is not P - Enter a valid PAN.';
  }

  if (!RegExp(r'^\d{4}$').hasMatch(value.substring(5, 9))) {
    return 'PAN - 6,7,8,9 places are not numbers - enter a valid PAN.';
  }

  if (RegExp(r'\d$').hasMatch(value[9])) {
    return 'PAN - last character is not an alphabet; enter a valid PAN.';
  }

  return null;
}
