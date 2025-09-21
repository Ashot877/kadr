class TFormatException implements Exception {
  final String message;

  const TFormatException([
    this.message = 'An unexpected format error occurred. Please check your input.',
  ]);

  /// Создание с кастомным сообщением
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Создание на основе кода ошибки
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatException('The email format is invalid. Please enter a valid email.');
      case 'password-too-short':
        return TFormatException('The password is too short. Minimum 6 characters required.');
      case 'username-invalid':
        return TFormatException('The username contains invalid characters.');
      case 'phone-invalid':
        return TFormatException('The phone number format is invalid.');
      default:
        return TFormatException('An unknown format error occurred. Please check your input.');
    }
  }

  /// Удобное получение сообщения
  String get formattedMessage => message;

  @override
  String toString() => message;
}
