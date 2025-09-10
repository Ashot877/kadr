class TValidator {
  TValidator._();

  // ------------------- Проверка Email -------------------
  static bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegExp.hasMatch(email);
  }

  // ------------------- Проверка пароля -------------------
  static bool isValidPassword(String password, {int minLength = 6}) {
    return password.length >= minLength;
  }

  // ------------------- Проверка телефона Армении -------------------
  static bool isValidArmenianPhone(String phone) {
    final RegExp phoneRegExp = RegExp(r'^(?:\+374|0)([0-9]{8})$');
    return phoneRegExp.hasMatch(phone.replaceAll(RegExp(r'[\s\-()]'), ''));
  }

  // ------------------- Проверка на пустую строку -------------------
  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  // ------------------- Проверка длины текста -------------------
  static bool hasMinLength(String value, int minLength) {
    return value.trim().length >= minLength;
  }

  static bool hasMaxLength(String value, int maxLength) {
    return value.trim().length <= maxLength;
  }
}
