String? validateEmail(String? value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Email is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid Email";
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }
  if (value.length < 8 || value.length > 15) {
    return "Password must be at least 8 to 15 characters long";
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return "Password must contain at least one uppercase letter";
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return "Password must contain at least one lowercase letter";
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Password must contain at least one numeric character";
  }
  if (!value.contains(RegExp(r'[!@#$%^&*()<>?/|}{~:]'))) {
    return "Password must contain at least one special character";
  }
  return null;
}

String? validationOtp(String? value) {
  if (value == null || value.isEmpty) {
    return 'Pin code is required';
  } else if (value.length < 4) {
    return 'Enter a valid 4-digit pin code';
  }
  return null;
}

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return "Full name is required";
  }
  if (value.length < 2 || value.length > 50) {
    return "Full name must be between 2 and 50 characters long";
  }
  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    return "Full name must contain only alphabetic characters and spaces";
  }
  return null;
}

String? validateNickName(String? value) {
  if (value == null || value.isEmpty) {
    return "Nickname is required";
  }
  if (value.length < 3 || value.length > 20) {
    return "Nickname must be between 3 and 20 characters long";
  }
  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
    return "Nickname must contain only alphanumeric characters and underscores";
  }
  return null;
}


String? validateBirthDate(String? value) {
  if (value == null || value.isEmpty) {
    return "Birthdate is required";
  }

  final DateTime? date = DateTime.tryParse(value);
  if (date == null) {
    return "Invalid date format";
  }

  final now = DateTime.now();
  final minDate = DateTime(now.year - 120, now.month, now.day);
  final maxDate = now;

  if (date.isBefore(minDate)) {
    return "Birthdate must be within the last 120 years";
  }
  if (date.isAfter(maxDate)) {
    return "Birthdate cannot be in the future";
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number is required";
  }

  // Define the pattern for a valid phone number
  final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');

  if (!phoneRegex.hasMatch(value)) {
    return "Please enter a valid 10-digit phone number";
  }

  return null;
}


String? validateGender(String? value) {
  if (value == null || value.isEmpty) {
    return "Gender selection is required";
  }


  final List<String> validGenders = ['Male', 'Female', 'Other'];

  if (!validGenders.contains(value)) {
    return "Please select a valid gender";
  }

  return null;
}


String? validateTitle(String? value) {
  if (value?.isNotEmpty == false) {
    return "Title is required";
  }
  if ((value ?? "").length < 2 ||( value ?? "").length > 60) {
    return "Title must be between 2 and 60 characters long";
  }
  if (!RegExp(r'^[a-zA-Z0-9\s.,!?]+$').hasMatch((value ?? ""))) {
    return "Title must contain only alphanumeric characters, spaces, and common punctuation";
  }
  return null;
}

String? validateDescription(String? value) {
  if (value == null || value.isEmpty) {
    return "Description is required";
  }
  if (value.length < 6 || value.length > 200) {
    return "Description must be between 6 and 200 characters long";
  }
  if (!RegExp(r'^[a-zA-Z0-9\s.,!?()\-"]+$').hasMatch(value)) {
  return "Description must contain only alphanumeric characters, spaces, and common punctuation";
  }
return null;
}