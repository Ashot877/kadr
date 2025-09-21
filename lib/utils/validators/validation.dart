class TValidator {
  TValidator._();


  static String? validateEmail(String? value)
  {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    final emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailReg.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value)
  {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  // ------------------- Проверка телефона Армении -------------------
  static bool isValidArmenianPhone(String phone) {
    final RegExp phoneRegExp = RegExp(r'^(?:\+374|0)([0-9]{8})$');
    return phoneRegExp.hasMatch(phone.replaceAll(RegExp(r'[\s\-()]'), ''));
  }

  static String? validatePhoneNumber(String? value)
  {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    final phoneReg = RegExp(r'^(?:\+374|0)([0-9]{8})$');

    if (!phoneReg.hasMatch(value)) {
      return 'Invalid phone number format (+374...).';
    }
    return null;
  }

  static bool hasMaxLength(String value, int maxLength) {
    return value.trim().length <= maxLength;
  }
}
